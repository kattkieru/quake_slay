
cmake_minimum_required(VERSION 3.4)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_SOURCE_DIR})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
set(CMAKE_INSTALL_PREFIX "${CMAKE_SOURCE_DIR}" CACHE PATH "..." FORCE)
set(INSTALL_BIN_DIR "${CMAKE_SOURCE_DIR}/bin")
set(INSTALL_LIB_DIR "${CMAKE_SOURCE_DIR}/lib")
set(INSTALL_INC_DIR "${CMAKE_SOURCE_DIR}/include")


if(WINDOWS)
	set(CMAKE_SHARED_LIBRARY_PREFIX "")
	set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_CRT_SECURE_NO_WARNINGS")
endif()

project(slayengine)

## for SDL2 -- override defaults
set(SDL_SHARED_ENABLED_BY_DEFAULT OFF)
set(SDL_STATIC_ENABLED_BY_DEFAULT ON)
option(SDL_STATIC_PIC "" ON)

if (MINGW OR MSVC)
	option(VIDEO_VULKAN "" ON)
	option(VIDEO_OPENGL "" OFF)
endif(MINGW OR MSVC)

add_subdirectory(contrib/zlib)
add_subdirectory(contrib/stb_image)
add_subdirectory(contrib/sdl2)
# add_subdirectory(src)

## this fixes linking in debug builds -- the 'd' postfix
## is largely irrelevant these days
# set_target_properties(SDL2main    PROPERTIES DEBUG_POSTFIX "")
# set_target_properties(SDL2-static PROPERTIES DEBUG_POSTFIX "")

# add_dependencies(slay SDL2-static SDL2main zlibstatic stb_image)


install(TARGETS zlibstatic stb_image SDL2-static SDL2main
		RUNTIME  DESTINATION "${INSTALL_BIN_DIR}"
		ARCHIVE  DESTINATION "${INSTALL_LIB_DIR}"
		LIBRARY  DESTINATION "${INSTALL_LIB_DIR}"
		INCLUDES DESTINATION "${INSTALL_INC_DIR}"
		)

