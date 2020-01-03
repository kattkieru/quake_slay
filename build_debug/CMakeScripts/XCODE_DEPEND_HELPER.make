# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.SDL2-static.Debug:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2d.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2d.a


PostBuild.SDL2main.Debug:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2maind.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2maind.a


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


PostBuild.slay.Debug:
PostBuild.zlibstatic.Debug: /Users/kiki/dev/slay/slay
PostBuild.stb_image.Debug: /Users/kiki/dev/slay/slay
PostBuild.SDL2-static.Debug: /Users/kiki/dev/slay/slay
PostBuild.SDL2main.Debug: /Users/kiki/dev/slay/slay
/Users/kiki/dev/slay/slay:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a\
	/Users/kiki/dev/slay/build_debug/contrib/stb_image/Debug/libstb_image.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2d.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2maind.a
	/bin/rm -f /Users/kiki/dev/slay/slay


PostBuild.stb_image.Debug:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/Debug/libstb_image.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/stb_image/Debug/libstb_image.a


PostBuild.zlib.Debug:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.dylib


PostBuild.zlibstatic.Debug:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a


PostBuild.SDL2-static.Release:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2.a


PostBuild.SDL2main.Release:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2main.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2main.a


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


PostBuild.slay.Release:
PostBuild.zlibstatic.Release: /Users/kiki/dev/slay/slay
PostBuild.stb_image.Release: /Users/kiki/dev/slay/slay
PostBuild.SDL2-static.Release: /Users/kiki/dev/slay/slay
PostBuild.SDL2main.Release: /Users/kiki/dev/slay/slay
/Users/kiki/dev/slay/slay:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a\
	/Users/kiki/dev/slay/build_debug/contrib/stb_image/Release/libstb_image.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2main.a
	/bin/rm -f /Users/kiki/dev/slay/slay


PostBuild.stb_image.Release:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/Release/libstb_image.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/stb_image/Release/libstb_image.a


PostBuild.zlib.Release:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.dylib


PostBuild.zlibstatic.Release:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a


PostBuild.SDL2-static.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2.a


PostBuild.SDL2main.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2main.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2main.a


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


PostBuild.slay.MinSizeRel:
PostBuild.zlibstatic.MinSizeRel: /Users/kiki/dev/slay/MinSizeRel/slay
PostBuild.stb_image.MinSizeRel: /Users/kiki/dev/slay/MinSizeRel/slay
PostBuild.SDL2-static.MinSizeRel: /Users/kiki/dev/slay/MinSizeRel/slay
PostBuild.SDL2main.MinSizeRel: /Users/kiki/dev/slay/MinSizeRel/slay
/Users/kiki/dev/slay/MinSizeRel/slay:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a\
	/Users/kiki/dev/slay/build_debug/contrib/stb_image/MinSizeRel/libstb_image.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2main.a
	/bin/rm -f /Users/kiki/dev/slay/MinSizeRel/slay


PostBuild.stb_image.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/MinSizeRel/libstb_image.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/stb_image/MinSizeRel/libstb_image.a


PostBuild.zlib.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.dylib


PostBuild.zlibstatic.MinSizeRel:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a


PostBuild.SDL2-static.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2.a


PostBuild.SDL2main.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2main.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2main.a


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


PostBuild.slay.RelWithDebInfo:
PostBuild.zlibstatic.RelWithDebInfo: /Users/kiki/dev/slay/RelWithDebInfo/slay
PostBuild.stb_image.RelWithDebInfo: /Users/kiki/dev/slay/RelWithDebInfo/slay
PostBuild.SDL2-static.RelWithDebInfo: /Users/kiki/dev/slay/RelWithDebInfo/slay
PostBuild.SDL2main.RelWithDebInfo: /Users/kiki/dev/slay/RelWithDebInfo/slay
/Users/kiki/dev/slay/RelWithDebInfo/slay:\
	/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a\
	/Users/kiki/dev/slay/build_debug/contrib/stb_image/RelWithDebInfo/libstb_image.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2.a\
	/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2main.a
	/bin/rm -f /Users/kiki/dev/slay/RelWithDebInfo/slay


PostBuild.stb_image.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/RelWithDebInfo/libstb_image.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/stb_image/RelWithDebInfo/libstb_image.a


PostBuild.zlib.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.dylib:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.dylib


PostBuild.zlibstatic.RelWithDebInfo:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a:
	/bin/rm -f /Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a




# For each target create a dummy ruleso the target does not have to exist
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2d.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Debug/libSDL2maind.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/MinSizeRel/libSDL2main.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/RelWithDebInfo/libSDL2main.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2.a:
/Users/kiki/dev/slay/build_debug/contrib/sdl2/Release/libSDL2main.a:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/Debug/libstb_image.a:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/MinSizeRel/libstb_image.a:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/RelWithDebInfo/libstb_image.a:
/Users/kiki/dev/slay/build_debug/contrib/stb_image/Release/libstb_image.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.1.2.11.dylib:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a:
