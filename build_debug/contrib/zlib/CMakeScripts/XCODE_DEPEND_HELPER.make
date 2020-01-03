# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.example.Debug:
PostBuild.zlib.Debug: /Users/kiki/dev/slay/example
/Users/kiki/dev/slay/example:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/example


PostBuild.minigzip.Debug:
PostBuild.zlib.Debug: /Users/kiki/dev/slay/minigzip
/Users/kiki/dev/slay/minigzip:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/minigzip


PostBuild.zlib.Debug:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.dylib


PostBuild.zlibstatic.Debug:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a


PostBuild.example.Release:
PostBuild.zlib.Release: /Users/kiki/dev/slay/example
/Users/kiki/dev/slay/example:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/example


PostBuild.minigzip.Release:
PostBuild.zlib.Release: /Users/kiki/dev/slay/minigzip
/Users/kiki/dev/slay/minigzip:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/minigzip


PostBuild.zlib.Release:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.dylib


PostBuild.zlibstatic.Release:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a


PostBuild.example.MinSizeRel:
PostBuild.zlib.MinSizeRel: /Users/kiki/dev/slay/MinSizeRel/example
/Users/kiki/dev/slay/MinSizeRel/example:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/MinSizeRel/example


PostBuild.minigzip.MinSizeRel:
PostBuild.zlib.MinSizeRel: /Users/kiki/dev/slay/MinSizeRel/minigzip
/Users/kiki/dev/slay/MinSizeRel/minigzip:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/MinSizeRel/minigzip


PostBuild.zlib.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.dylib


PostBuild.zlibstatic.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a


PostBuild.example.RelWithDebInfo:
PostBuild.zlib.RelWithDebInfo: /Users/kiki/dev/slay/RelWithDebInfo/example
/Users/kiki/dev/slay/RelWithDebInfo/example:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/RelWithDebInfo/example


PostBuild.minigzip.RelWithDebInfo:
PostBuild.zlib.RelWithDebInfo: /Users/kiki/dev/slay/RelWithDebInfo/minigzip
/Users/kiki/dev/slay/RelWithDebInfo/minigzip:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.1.2.11.dylib
	/bin/rm -f /Users/kiki/dev/slay/RelWithDebInfo/minigzip


PostBuild.zlib.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.dylib


PostBuild.zlibstatic.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a




# For each target create a dummy ruleso the target does not have to exist
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.1.2.11.dylib:
