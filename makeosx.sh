#!/bin/sh
git submodule update --init --recursive
mkdir build
pushd build
cmake -DVULKAN_SDK:STRING=../vulkansdk/macOS ..
popd
cmake --build build --config Debug

