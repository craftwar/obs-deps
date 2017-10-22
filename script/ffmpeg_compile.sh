cd /c/projects/$APPVEYOR_PROJECT_NAME/ffmpeg
PKG_CONFIG_PATH="$pkg_prefix_mingw/lib/pkgconfig" LDFLAGS="-L/home$pkg_prefix_mingw/lib" CPPFLAGS="-I$pkg_prefix_mingw/include" \
	./configure --prefix=$pkg_prefix_mingw --enable-shared \
	--extra-cflags="-I$pkg_prefix_win\include" --extra-ldflags="/LIBPATH:$pkg_prefix_win\lib" \
	--toolchain=msvc --enable-version3 --enable-gpl --disable-programs --disable-doc --arch=x86_64 --enable-libx264 \
	--enable-zlib --enable-encoder=png \
	--disable-xlib \
	--disable-postproc --disable-debug
make
make install
