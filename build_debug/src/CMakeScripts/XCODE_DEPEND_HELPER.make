# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
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
/Users/kiki/dev/slay/build_debug/contrib/zlib/Debug/libz.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/MinSizeRel/libz.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/RelWithDebInfo/libz.a:
/Users/kiki/dev/slay/build_debug/contrib/zlib/Release/libz.a:
