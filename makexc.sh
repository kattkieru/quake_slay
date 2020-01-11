#!/bin/sh
git submodule update --init --recursive
mkdir build_debug
pushd build_debug
cmake -DVULKAN_SDK:STRING=../vulkansdk/macOS -G "Xcode" ..
popd
