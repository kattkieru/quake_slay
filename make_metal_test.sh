#!/bin/bash

export SDKROOT=`xcrun --show-sdk-path`
export FRAMEWORKS=$SDKROOT/System/Library/Frameworks

clang metal_test.m -o metal_test -framework Metal -framework MetalKit -framework Foundation -framework QuartzCore -framework IOKit -framework IOSurface

./metal_test
