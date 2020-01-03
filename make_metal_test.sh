#!/bin/sh

clang metal_test.m -o metal_test -F /System/Library/Frameworks -framework /System/Library/Frameworks/Metal.framework /System/Library/Frameworks/MetalKit.framework -framework /System/Library/Frameworks/Foundation.framework -framework /System/Library/Frameworks/QuartzCore.framework -framework /System/Library/Frameworks/IOKit.framework -framework /System/Library/Frameworks/IOSurface.framework

./metal_test
