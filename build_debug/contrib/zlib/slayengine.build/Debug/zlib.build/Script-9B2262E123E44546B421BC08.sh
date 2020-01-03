#!/bin/sh
make -C /Users/kiki/dev/slay/build_debug/contrib/zlib -f /Users/kiki/dev/slay/build_debug/contrib/zlib/CMakeScripts/zlib_postBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
