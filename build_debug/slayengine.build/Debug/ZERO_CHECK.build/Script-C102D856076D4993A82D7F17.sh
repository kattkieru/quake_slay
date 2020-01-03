#!/bin/sh
make -C /Users/kiki/dev/slay/build_debug -f /Users/kiki/dev/slay/build_debug/CMakeScripts/ZERO_CHECK_cmakeRulesBuildPhase.make$CONFIGURATION OBJDIR=$(basename "$OBJECT_FILE_DIR_normal") all
