cd /c/projects/$APPVEYOR_PROJECT_NAME/ffmpeg
date
PKG_CONFIG_PATH="$pkg_prefix_mingw/lib/pkgconfig" LDFLAGS="-L/home$pkg_prefix_mingw/lib" CPPFLAGS="-I$pkg_prefix_mingw/include" \
	./configure --prefix=$pkg_prefix_mingw --enable-shared \
	--extra-cflags="-MP -Oi -arch:AVX2 -GL -DHAVE_UNISTD_H=0 -I$pkg_prefix_win\include" \
	--extra-cxxflags="-MP -Oi -arch:AVX2 -GL -I$pkg_prefix_win\include" \
	--extra-ldflags="-LTCG -LIBPATH:$pkg_prefix_win\lib" \
	--toolchain=msvc --enable-version3 --enable-gpl --disable-programs --disable-doc --arch=x86_64 --host-os=win64 --target-os=win64 --cpu=i686\
	--enable-libx264 \
	--enable-zlib --enable-encoder=png \
	--disable-xlib \
	--disable-postproc --disable-debug
date
make /j
make install
