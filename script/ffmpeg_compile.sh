cd /c/projects/$APPVEYOR_PROJECT_NAME/ffmpeg
#configure takes a few mintues
PKG_CONFIG_PATH="$pkg_prefix_mingw/lib/pkgconfig" ASFLAGS="-O5" \
	./configure --prefix=$pkg_prefix_mingw --enable-shared \
	--extra-cflags="-O2 -MP -arch:AVX2 -Gw -Gy -GL -GS- -favor:$favor_arch -I$pkg_prefix_win\include" \
	--extra-cxxflags="-O2 -MP -arch:AVX2 -Gw -Gy -GL -GS- -favor:$favor_arch -I$pkg_prefix_win\include" \
	--extra-ldflags="-LTCG -LIBPATH:$pkg_prefix_win\lib" \
	--toolchain=msvc --enable-gpl --arch=x86_64 --host-os=win64 --target-os=win64 --cpu=i686\
	--disable-amd3dnow --disable-amd3dnowext --disable-xop \
	--enable-libx264 \
	--enable-zlib --enable-encoder=png \
	--disable-programs --disable-doc \
	--disable-xlib \
	--disable-postproc --disable-debug $ffmpeg_extra_options
make -j install
#patch configure doesn't work
#sed -i "s/if ! disabled_any asm mmx/if ! disabled_any asm/" configure
# disable these will disable AVX and later instrunctions (mmx only?)
#	--disable-mmx --disable-mmxext \
#	--disable-sse --disable-sse2 --disable-sse3 --disable-ssse3 --disable-sse4 --disable-sse42 \
