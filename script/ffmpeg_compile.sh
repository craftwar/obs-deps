cd /c/projects/$APPVEYOR_PROJECT_NAME/ffmpeg
#configure takes a few mintues
PKG_CONFIG_PATH="$pkg_prefix_mingw/lib/pkgconfig" ASFLAGS="-O5" \
	./configure --prefix=$pkg_prefix_mingw --enable-shared \
	--extra-cflags="-O2 -MP -arch:AVX2 -Gw -Gy -GS- -favor:$favor_arch -I$pkg_prefix_win\include" \
	--extra-cxxflags="-O2 -MP -arch:AVX2 -Gw -Gy -GL -GS- -favor:$favor_arch -I$pkg_prefix_win\include" \
	--extra-ldflags="-LTCG -LIBPATH:$pkg_prefix_win\lib" \
	--toolchain=msvc --enable-gpl --arch=x86_64 --host-os=win64 --target-os=win64 --cpu=i686\
	--disable-amd3dnow --disable-amd3dnowext --disable-xop \
	--enable-libx264 \
	--enable-zlib --enable-encoder=png \
	--disable-programs --disable-doc \
	--disable-xlib \
	--disable-postproc --disable-debug
make -j install
