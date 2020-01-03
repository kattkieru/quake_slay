cmake_minimum_required(VERSION 3.4)

project(slay)

set( SOURCES
	main.cpp
	Application.cpp
	Frustum.cpp
	InputHandlers.cpp
	Math.cpp
	StringHelpers.cpp
	ThreadProcessor.cpp
	Utils.cpp

	q3bsp/Q3BspLoader.cpp
	q3bsp/Q3BspMap.cpp
	q3bsp/Q3BspPatch.cpp
	q3bsp/Q3BspStatsUI.cpp

	renderer/Camera.cpp
	renderer/CameraDirector.cpp
	renderer/Font.cpp
	renderer/GameTexture.cpp
	renderer/RenderContext.cpp
	renderer/TextureManager.cpp
	
	renderer/vulkan/Base.cpp
	renderer/vulkan/Buffers.cpp
	renderer/vulkan/CmdBuffer.cpp
	renderer/vulkan/Device.cpp
	renderer/vulkan/Image.cpp
	renderer/vulkan/Pipeline.cpp
	renderer/vulkan/Validation.cpp
	renderer/vulkan/VkMemAlloc.cpp

)

include_directories(
	.
	common
	q3bsp
	renderer
	../contrib/sdl2/include
	../contrib/stb_image
	../contrib/zlib
	../contrib/imgui/
)

add_executable(slay ${SOURCES})
target_compile_options(slay PUBLIC "-Wno-c++11-extensions")

if (APPLE)
	set (VULKAN_LIB "libvulkan.1.dylib")
elseif (WIN32)
	set (VULKAN_LIB "vulkan-1.lib")
else()
	message( FATAL_ERROR "Unsupported OS" )
endif(APPLE)

target_link_libraries(
	slay
	zlibstatic stb_image SDL2-static SDL2main
	${VULKAN_LIB}
	${EXTRA_LIBS}
)
