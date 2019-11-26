@echo off
git submodule update --init --recursive
REM git submodule foreach --recursive git fetch
mkdir build
pushd build
cmake -G "Visual Studio 15 2017 Win64" -DVULKAN_SDK:STRING=D:/vulkan_sdk/1.1.126.0 ..
popd
cmake --build build --config Release

