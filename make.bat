@echo off
git submodule update --init --recursive
REM git submodule foreach --recursive git fetch
mkdir build
pushd build
cmake -G "Visual Studio 15 2017 Win64" ..
popd
cmake --build build --config Release --target install

