#include "renderer/RenderContext.hpp"
#include "renderer/vulkan/CmdBuffer.hpp"
#include "renderer/vulkan/Pipeline.hpp"
#include "renderer/vulkan/Validation.hpp"
#include "renderer/TextureManager.hpp"
#ifdef __ANDROID__
#include "android/vulkan_wrapper.h"
#endif
#include "Utils.hpp"
#include <algorithm>

// not using pipeline dynamic state?
//#define INLINE_COMMANDS

// Returns the maximum sample count usable by the platform
static VkSampleCountFlagBits getMaxUsableSampleCount(const VkPhysicalDeviceProperties &deviceProperties)
{
    VkSampleCountFlags counts = std::min(deviceProperties.limits.framebufferColorSampleCounts, deviceProperties.limits.framebufferDepthSampleCounts);
    if (counts & VK_SAMPLE_COUNT_64_BIT) { return VK_SAMPLE_COUNT_64_BIT; }
    if (counts & VK_SAMPLE_COUNT_32_BIT) { return VK_SAMPLE_COUNT_32_BIT; }
    if (counts & VK_SAMPLE_COUNT_16_BIT) { return VK_SAMPLE_COUNT_16_BIT; }
    if (counts & VK_SAMPLE_COUNT_8_BIT) { return VK_SAMPLE_COUNT_8_BIT; }
    if (counts & VK_SAMPLE_COUNT_4_BIT) { return VK_SAMPLE_COUNT_4_BIT; }
    if (counts & VK_SAMPLE_COUNT_2_BIT) { return VK_SAMPLE_COUNT_2_BIT; }
    return VK_SAMPLE_COUNT_1_BIT;
}

// initialize Vulkan render context
bool RenderContext::Init(const char *title, int x, int y, int w, int h)
{
    uint32_t windowFlags = SDL_WINDOW_VULKAN | SDL_WINDOW_RESIZABLE | SDL_WINDOW_SHOWN | SDL_WINDOW_ALLOW_HIGHDPI;
    // SDL overrides status bar visibility on iOS in Info.plist unless SDL_WINDOW_FULLSCREEN is explicitly passed as a flag. This also makes the SDL_Vulkan_GetDrawableSize() function return correct results!
#if TARGET_OS_IPHONE
    windowFlags |= SDL_WINDOW_FULLSCREEN;
#endif
    window = SDL_CreateWindow(title, x, y, w, h, windowFlags);

    if (!window) {
        printf("-- SDL_CreateWindow failed: %s.\n", SDL_GetError());
        exit(1);
    }

    m_windowTitle = title;
    SDL_Vulkan_GetDrawableSize(window, &width, &height);

    halfWidth  = width  >> 1;
    halfHeight = height >> 1;
    scrRatio   = (float)width / (float)height;
/*
 *       ----(1.0)---
 *       |          |
 *    -ratio      ratio
 *       |          |
 *       ---(-1.0)---
 */
    left   = -scrRatio;
    right  = scrRatio;
    bottom = -1.0f;
    top    = 1.0f;

    return InitVulkan(title);
}

void RenderContext::Destroy()
{
    if (window)
    {
        vkDeviceWaitIdle(m_device.logical);

        vk::destroyRenderPass(m_device, m_renderPass);
        vk::destroyRenderPass(m_device, m_msaaRenderPass);
        vk::freeCommandBuffers(m_device, m_device.commandPool, m_commandBuffers);
        vkDestroyCommandPool(m_device.logical, m_device.commandPool, nullptr);
        vkDestroyCommandPool(m_device.logical, m_device.transferCommandPool, nullptr);
 
        DestroyFramebuffers();
        DestroyImageViews();
        DestroyDrawBuffers();

        TextureManager::GetInstance()->ReleaseTextures();

        vkDestroySwapchainKHR(m_device.logical, m_swapChain.sc, nullptr);

        for (int i = 0; i < NUM_CMDBUFFERS; ++i)
        {
            vkDestroySemaphore(m_device.logical, m_imageAvailableSemaphores[i], nullptr);
            vkDestroySemaphore(m_device.logical, m_renderFinishedSemaphores[i], nullptr);
            vkDestroyFence(m_device.logical, m_fences[i], nullptr);
        }

        vk::destroyAllocator(m_device.allocator);
        vkDestroyPipelineCache(m_device.logical, m_pipelineCache, nullptr);
        vkDestroyDevice(m_device.logical, nullptr);
        vkDestroySurfaceKHR(m_instance, m_surface, nullptr);
#ifdef VALIDATION_LAYERS_ON
        vk::destroyValidationLayers(m_instance);
#endif
        vkDestroyInstance(m_instance, nullptr);
        SDL_DestroyWindow(window);
        window = nullptr;
    }
}

VkResult RenderContext::RenderStart()
{
    VkResult result = vkAcquireNextImageKHR(m_device.logical, m_swapChain.sc, UINT64_MAX, m_imageAvailableSemaphores[m_currentCmdBuffer], VK_NULL_HANDLE, &m_imageIndex);
    m_activeCmdBuffer = m_commandBuffers[m_currentCmdBuffer];
    m_activeFramebuffer = (m_activeRenderPass.sampleCount == VK_SAMPLE_COUNT_1_BIT) ? m_frameBuffers[m_imageIndex] : m_msaaFrameBuffers[m_imageIndex];

    // swapchain has become incompatible - need to recreate it
    if (result == VK_ERROR_OUT_OF_DATE_KHR)
    {
        LOG_MESSAGE("SwapChain incompatible after vkAcquireNextImageKHR - rebuilding!");
        RecreateSwapChain();
        return result;
    }

    VK_VERIFY(vkWaitForFences(m_device.logical, 1, &m_fences[m_currentCmdBuffer], VK_TRUE, UINT64_MAX));
    vkResetFences(m_device.logical, 1, &m_fences[m_currentCmdBuffer]);

    LOG_MESSAGE_ASSERT(result == VK_SUCCESS || result == VK_SUBOPTIMAL_KHR, "Could not acquire swapchain image: " << result);

    // setup command buffers and render pass for drawing
    VkCommandBufferBeginInfo beginInfo = {};
    beginInfo.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_BEGIN_INFO;
    beginInfo.flags = VK_COMMAND_BUFFER_USAGE_ONE_TIME_SUBMIT_BIT;
    beginInfo.pInheritanceInfo = nullptr;

    result = vkBeginCommandBuffer(m_commandBuffers[m_currentCmdBuffer], &beginInfo);
    LOG_MESSAGE_ASSERT(result == VK_SUCCESS, "Could not begin command buffer: " << result);

    VkClearValue clearColors[2];
    clearColors[0].color = { 0.f, 0.f, 0.f, 1.f };
    clearColors[1].depthStencil = { 1.0f, 0 };
    VkRenderPassBeginInfo renderBeginInfo = {};
    renderBeginInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    renderBeginInfo.renderPass = m_activeRenderPass.renderPass;
    renderBeginInfo.framebuffer = m_activeFramebuffer;
    renderBeginInfo.renderArea.offset = { 0, 0 };
    renderBeginInfo.renderArea.extent = m_swapChain.extent;
    renderBeginInfo.clearValueCount = 2;
    renderBeginInfo.pClearValues = clearColors;

#ifndef INLINE_COMMANDS
    vkCmdBeginRenderPass(m_commandBuffers[m_currentCmdBuffer], &renderBeginInfo, VK_SUBPASS_CONTENTS_SECONDARY_COMMAND_BUFFERS);
#else
    vkCmdBeginRenderPass(m_commandBuffers[m_currentCmdBuffer], &renderBeginInfo, VK_SUBPASS_CONTENTS_INLINE);
    vkCmdSetViewport(m_commandBuffers[m_currentCmdBuffer], 0, 1, &m_viewport);
    vkCmdSetScissor(m_commandBuffers[m_currentCmdBuffer], 0, 1, &m_scissor);
#endif

    return VK_SUCCESS;
}

VkResult RenderContext::Submit()
{
    vkCmdEndRenderPass(m_commandBuffers[m_currentCmdBuffer]);
    VK_VERIFY(vkEndCommandBuffer(m_commandBuffers[m_currentCmdBuffer]));

    VkPipelineStageFlags waitStages[] = { VK_PIPELINE_STAGE_COLOR_ATTACHMENT_OUTPUT_BIT };
    VkSubmitInfo submitInfo = {};
    submitInfo.sType = VK_STRUCTURE_TYPE_SUBMIT_INFO;
    submitInfo.waitSemaphoreCount = 1;
    submitInfo.pWaitSemaphores = &m_imageAvailableSemaphores[m_currentCmdBuffer];
    submitInfo.signalSemaphoreCount = 1;
    submitInfo.pSignalSemaphores = &m_renderFinishedSemaphores[m_currentCmdBuffer];
    submitInfo.pWaitDstStageMask = waitStages;
    submitInfo.commandBufferCount = 1;
    submitInfo.pCommandBuffers = &m_commandBuffers[m_currentCmdBuffer];

    return vkQueueSubmit(m_device.graphicsQueue, 1, &submitInfo, m_fences[m_currentCmdBuffer]);
}

VkResult RenderContext::Present()
{
    VkSwapchainKHR swapChains[] = { m_swapChain.sc };
    VkPresentInfoKHR presentInfo = {};
    presentInfo.sType = VK_STRUCTURE_TYPE_PRESENT_INFO_KHR;
    presentInfo.waitSemaphoreCount = 1;
    presentInfo.pWaitSemaphores = &m_renderFinishedSemaphores[m_currentCmdBuffer];
    presentInfo.swapchainCount = 1;
    presentInfo.pSwapchains = swapChains;
    presentInfo.pImageIndices = &m_imageIndex;
    presentInfo.pResults = nullptr;

    VkResult renderResult = vkQueuePresentKHR(m_device.presentQueue, &presentInfo);

    // recreate swapchain if it's out of date
    if (renderResult == VK_ERROR_OUT_OF_DATE_KHR || renderResult == VK_SUBOPTIMAL_KHR)
    {
        LOG_MESSAGE("SwapChain out of date/suboptimal after vkQueuePresentKHR - rebuilding!");
        RecreateSwapChain();
    }

    m_currentCmdBuffer = (m_currentCmdBuffer + 1) % NUM_CMDBUFFERS;

    return renderResult;
}

Math::Vector2f RenderContext::WindowSize()
{
    VkSurfaceCapabilitiesKHR surfaceCaps;
    vkGetPhysicalDeviceSurfaceCapabilitiesKHR(m_device.physical, m_surface, &surfaceCaps);
    LOG_MESSAGE_ASSERT(surfaceCaps.currentExtent.width != std::numeric_limits<uint32_t>::max(), "WM sets extent width and height to max uint32!");

    // fallback if WM sets extent dimensions to max uint32
    if (surfaceCaps.currentExtent.width == std::numeric_limits<uint32_t>::max())
    {
        // fetch current window width and height from SDL, since we can't rely on WM in this case
        SDL_Vulkan_GetDrawableSize(window, &width, &height);
        float w = (float)std::max(surfaceCaps.minImageExtent.width,  std::min(surfaceCaps.maxImageExtent.width,  (uint32_t)width));
        float h = (float)std::max(surfaceCaps.minImageExtent.height, std::min(surfaceCaps.maxImageExtent.height, (uint32_t)height));
        return Math::Vector2f(w, h);
    }

    return Math::Vector2f((float)surfaceCaps.currentExtent.width, (float)surfaceCaps.currentExtent.height);
}

VkSampleCountFlagBits RenderContext::ToggleMSAA()
{
    // "flip" render passes on MSAA toggle
    vkDeviceWaitIdle(m_device.logical);
    m_activeRenderPass = (m_activeRenderPass.renderPass == m_msaaRenderPass.renderPass) ? m_renderPass : m_msaaRenderPass;

    return m_activeRenderPass.sampleCount;
}

bool RenderContext::RecreateSwapChain()
{
    vkDeviceWaitIdle(m_device.logical);
    DestroyFramebuffers();
    DestroyImageViews();

    // using Vulkan in conjuction with SDL2 causes vkCreateSwapChainKHR and/or vkAcquireNextImageKHR to return VK_ERROR_INITIALIZATION_FAILED when
    // app regains focus (which is not even spec compliant) - the easiest/fastest way to fix this is to recreate entire surface along with the swapchain
    // sidenote: stay away from SDL2 if you want Vulkan on Android!
#ifdef __ANDROID__
    vkDestroySwapchainKHR(m_device.logical, m_swapChain.sc, nullptr);
    vkDestroySurfaceKHR(m_instance, m_surface, nullptr);
    SDL_Vulkan_CreateSurface(window, m_instance, &m_surface);
    m_swapChain.sc = VK_NULL_HANDLE;
#endif

    // set initial swap chain extent to current window size - in case WM can't determine it by itself
    m_swapChain.extent = { (uint32_t)width, (uint32_t)height };
    VK_VERIFY(vk::createSwapChain(m_device, m_surface, &m_swapChain, m_swapChain.sc));

    m_viewport.width  = (float)m_swapChain.extent.width;
    m_viewport.height = (float)m_swapChain.extent.height;
    m_scissor.extent  = m_swapChain.extent;

    // update internal render context dimensions
    width  = m_swapChain.extent.width;
    height = m_swapChain.extent.height;
    halfWidth  = width >> 1;
    halfHeight = height >> 1;
    scrRatio = m_viewport.width / m_viewport.height;
    left = -scrRatio;
    right = scrRatio;

    DestroyDrawBuffers();
    CreateDrawBuffers();
    if (!CreateImageViews()) return false;
    m_frameBuffers = CreateFramebuffers(m_renderPass);
    m_msaaFrameBuffers = CreateFramebuffers(m_msaaRenderPass);

    return true;
}

bool RenderContext::InitVulkan(const char *appTitle)
{
#ifdef __ANDROID__
    // initialize Vulkan function pointers in vulkan_wrapper.h/cpp
    bool vkSupported = ::InitVulkan();
    LOG_MESSAGE_ASSERT(vkSupported, "This Android device has no Vulkan support!");
    if (!vkSupported)
        return false;
#endif
    VK_VERIFY(vk::createInstance(window, &m_instance, appTitle));
    // "oldschool" way of creating a Vulkan surface in SDL prior to 2.0.6
    //VK_VERIFY(vk::createSurface(window, m_instance, &m_surface));
    SDL_Vulkan_CreateSurface(window, m_instance, &m_surface);

    m_device = vk::createDevice(m_instance, m_surface);
    VK_VERIFY(vk::createAllocator(m_device, &m_device.allocator));
    // set initial swap chain extent to current window size - in case WM can't determine it by itself
    m_swapChain.extent = { (uint32_t)width, (uint32_t)height };
    // desired present mode
#ifdef __ANDROID__
    m_swapChain.presentMode = VK_PRESENT_MODE_FIFO_KHR;
#else
    m_swapChain.presentMode = VK_PRESENT_MODE_MAILBOX_KHR;
#endif

    VK_VERIFY(vk::createSwapChain(m_device, m_surface, &m_swapChain, VK_NULL_HANDLE));

    m_viewport.x = 0.f;
    m_viewport.y = 0.f;
    m_viewport.minDepth = 0.f;
    m_viewport.maxDepth = 1.f;
    m_viewport.width  = (float)m_swapChain.extent.width;
    m_viewport.height = (float)m_swapChain.extent.height;

    m_scissor.offset.x = 0;
    m_scissor.offset.y = 0;
    m_scissor.extent = m_swapChain.extent;

    CreateFences();
    CreateSemaphores();
    CreatePipelineCache();

    m_msaaRenderPass.sampleCount = getMaxUsableSampleCount(m_device.properties);

    VK_VERIFY(vk::createRenderPass(m_device, m_swapChain, &m_renderPass));
    VK_VERIFY(vk::createRenderPass(m_device, m_swapChain, &m_msaaRenderPass));
    VK_VERIFY(vk::createCommandPool(m_device, m_device.graphicsFamilyIndex, &m_device.commandPool));
    VK_VERIFY(vk::createCommandPool(m_device, m_device.transferFamilyIndex, &m_device.transferCommandPool));
    CreateDrawBuffers();
    if (!CreateImageViews()) return false;
    m_frameBuffers = CreateFramebuffers(m_renderPass);
    m_msaaFrameBuffers = CreateFramebuffers(m_msaaRenderPass);
    m_activeRenderPass = m_renderPass;

    // allocate NUM_CMDBUFFERS command buffers (used to be m_frameBuffers.size())
    VK_VERIFY(vk::createCommandBuffers(m_device, m_device.commandPool, VK_COMMAND_BUFFER_LEVEL_PRIMARY, m_commandBuffers, NUM_CMDBUFFERS));

    return true;
}

void RenderContext::CreateDrawBuffers()
{
    // standard depth buffer
    m_depthBuffer = vk::createDepthBuffer(m_device, m_swapChain, m_renderPass.sampleCount);
    // additional render targets for MSAA
    m_msaaDepthBuffer = vk::createDepthBuffer(m_device, m_swapChain, m_msaaRenderPass.sampleCount);
    m_msaaColor = vk::createColorBuffer(m_device, m_swapChain, m_msaaRenderPass.sampleCount);
}

void RenderContext::DestroyDrawBuffers()
{
    auto destroyDrawBuffer = [](vk::Device &device, vk::Texture &drawBuffer) {
        if (drawBuffer.image != VK_NULL_HANDLE)
        {
            vmaDestroyImage(device.allocator, drawBuffer.image, drawBuffer.allocation);
            vkDestroyImageView(device.logical, drawBuffer.imageView, nullptr);
            drawBuffer.image = VK_NULL_HANDLE;
            drawBuffer.imageView = VK_NULL_HANDLE;
        }
    };

    destroyDrawBuffer(m_device, m_depthBuffer);
    destroyDrawBuffer(m_device, m_msaaDepthBuffer);
    destroyDrawBuffer(m_device, m_msaaColor);
}

bool RenderContext::CreateImageViews()
{
    m_imageViews.resize(m_swapChain.images.size());

    for (size_t i = 0; i < m_swapChain.images.size(); ++i)
    {
        VkResult result = vk::createImageView(m_device, m_swapChain.images[i], VK_IMAGE_ASPECT_COLOR_BIT, &m_imageViews[i], m_swapChain.format, 1);

        if (result != VK_SUCCESS)
        {
            VK_VERIFY(result);
            DestroyImageViews();
            return false;
        }
    }

    return true;
}

void RenderContext::DestroyImageViews()
{
    for (VkImageView &iv : m_imageViews)
        vkDestroyImageView(m_device.logical, iv, nullptr);
}

std::vector<VkFramebuffer> RenderContext::CreateFramebuffers(const vk::RenderPass &rp)
{
    std::vector<VkFramebuffer> frameBuffers(m_imageViews.size());

    VkFramebufferCreateInfo fbCreateInfo = {};
    fbCreateInfo.sType = VK_STRUCTURE_TYPE_FRAMEBUFFER_CREATE_INFO;
    fbCreateInfo.renderPass = rp.renderPass;
    fbCreateInfo.attachmentCount = (rp.sampleCount != VK_SAMPLE_COUNT_1_BIT) ? 3 : 2;
    fbCreateInfo.width  = m_swapChain.extent.width;
    fbCreateInfo.height = m_swapChain.extent.height;
    fbCreateInfo.layers = 1;

    for (size_t i = 0; i < frameBuffers.size(); ++i)
    {
        VkImageView attachments[] = { m_imageViews[i], m_depthBuffer.imageView };
        VkImageView attachmentsMSAA[] = { m_msaaColor.imageView, m_msaaDepthBuffer.imageView, m_imageViews[i] };

        fbCreateInfo.pAttachments = (rp.sampleCount != VK_SAMPLE_COUNT_1_BIT) ? attachmentsMSAA : attachments;
        VkResult result = vkCreateFramebuffer(m_device.logical, &fbCreateInfo, nullptr, &frameBuffers[i]);

        if (result != VK_SUCCESS)
        {
            VK_VERIFY(result);
            DestroyFramebuffers();
            break;
        }
    }

    return frameBuffers;
}

void RenderContext::DestroyFramebuffers()
{
    for (size_t i = 0; i < m_imageViews.size(); ++i)
    {
        vkDestroyFramebuffer(m_device.logical, m_frameBuffers[i], nullptr);
        vkDestroyFramebuffer(m_device.logical, m_msaaFrameBuffers[i], nullptr);
    }

    m_frameBuffers.clear();
    m_msaaFrameBuffers.clear();
}

void RenderContext::CreateFences()
{
    VkFenceCreateInfo fCreateInfo = {};
    fCreateInfo.sType = VK_STRUCTURE_TYPE_FENCE_CREATE_INFO;
    fCreateInfo.flags = VK_FENCE_CREATE_SIGNALED_BIT;

    for (int i = 0; i < NUM_CMDBUFFERS; ++i)
    {
        VK_VERIFY(vkCreateFence(m_device.logical, &fCreateInfo, nullptr, &m_fences[i]));
    }
}

void RenderContext::CreateSemaphores()
{
    VkSemaphoreCreateInfo sCreateInfo = {};
    sCreateInfo.sType = VK_STRUCTURE_TYPE_SEMAPHORE_CREATE_INFO;

    for (int i = 0; i < NUM_CMDBUFFERS; ++i)
    {
        VK_VERIFY(vkCreateSemaphore(m_device.logical, &sCreateInfo, nullptr, &m_imageAvailableSemaphores[i]));
        VK_VERIFY(vkCreateSemaphore(m_device.logical, &sCreateInfo, nullptr, &m_renderFinishedSemaphores[i]));
    }
}

void RenderContext::CreatePipelineCache()
{
    VkPipelineCacheCreateInfo pcInfo = {};
    pcInfo.sType = VK_STRUCTURE_TYPE_PIPELINE_CACHE_CREATE_INFO;

    VK_VERIFY(vkCreatePipelineCache(m_device.logical, &pcInfo, nullptr, &m_pipelineCache));
}
