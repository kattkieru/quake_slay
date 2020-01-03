# Install script for directory: /Users/kiki/dev/slay/contrib/sdl2

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/Users/kiki/dev/slay")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2d.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2d.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2d.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2d.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2.a")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2maind.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2maind.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2maind.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2maind.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2main.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2main.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a")
    endif()
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2main.a")
    if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a" AND
       NOT IS_SYMLINK "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a")
      execute_process(COMMAND "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/ranlib" "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/libSDL2main.a")
    endif()
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake"
         "/Users/kiki/dev/slay/build_debug/contrib/sdl2/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2/SDL2Targets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/CMakeFiles/Export/lib/cmake/SDL2/SDL2Targets-release.cmake")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xDevelx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/cmake/SDL2" TYPE FILE FILES
    "/Users/kiki/dev/slay/contrib/sdl2/SDL2Config.cmake"
    "/Users/kiki/dev/slay/build_debug/SDL2ConfigVersion.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/SDL2" TYPE FILE FILES
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_assert.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_atomic.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_audio.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_bits.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_blendmode.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_clipboard.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_android.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_iphoneos.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_macosx.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_minimal.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_os2.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_pandora.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_psp.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_windows.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_winrt.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_config_wiz.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_copying.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_cpuinfo.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_egl.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_endian.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_error.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_events.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_filesystem.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_gamecontroller.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_gesture.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_haptic.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_hints.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_joystick.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_keyboard.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_keycode.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_loadso.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_log.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_main.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_messagebox.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_metal.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_mouse.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_mutex.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_name.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengl.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengl_glext.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengles.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengles2.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengles2_gl2.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengles2_gl2ext.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengles2_gl2platform.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_opengles2_khrplatform.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_pixels.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_platform.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_power.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_quit.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_rect.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_render.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_revision.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_rwops.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_scancode.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_sensor.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_shape.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_stdinc.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_surface.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_system.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_syswm.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_assert.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_common.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_compare.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_crc32.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_font.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_fuzzer.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_harness.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_images.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_log.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_md5.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_memory.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_test_random.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_thread.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_timer.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_touch.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_types.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_version.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_video.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/SDL_vulkan.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/begin_code.h"
    "/Users/kiki/dev/slay/contrib/sdl2/include/close_code.h"
    "/Users/kiki/dev/slay/build_debug/contrib/sdl2/include/SDL_config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/sdl2.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE PROGRAM FILES "/Users/kiki/dev/slay/build_debug/contrib/sdl2/sdl2-config")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/Users/kiki/dev/slay/share/aclocal/sdl2.m4")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
file(INSTALL DESTINATION "/Users/kiki/dev/slay/share/aclocal" TYPE FILE FILES "/Users/kiki/dev/slay/contrib/sdl2/sdl2.m4")
endif()

