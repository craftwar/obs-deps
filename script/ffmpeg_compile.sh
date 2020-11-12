cd /c/projects/$APPVEYOR_PROJECT_NAME/ffmpeg
#configure takes a few mintues
PKG_CONFIG_PATH="$pkg_prefix_mingw/lib/pkgconfig" ASFLAGS="-O5" \
	./configure --prefix=$pkg_prefix_mingw --enable-shared \
	--extra-cflags="-O2 -MP -arch:$vc_inc_arch -Gw -Gy -GS- -Qspectre- -favor:$favor_arch -Zc:__cplusplus -Zc:inline -std:c17 $cl_cpu_options -I$pkg_prefix_win\include" \
	--extra-cxxflags="-O2 -MP -arch:$vc_inc_arch -Gw -Gy -GL -GS- -Qspectre- -favor:$favor_arch -Zc:__cplusplus -std:c17 $cl_cpu_options -I$pkg_prefix_win\include" \
	--extra-ldflags="-LTCG -LIBPATH:$pkg_prefix_win\lib" \
	--toolchain=msvc --enable-gpl --arch=x86_64 --host-os=win64 --target-os=win64 --cpu=i686 \
	--disable-amd3dnow --disable-amd3dnowext --disable-xop \
	--enable-libx264 \
	--enable-zlib --enable-encoder=png \
	--disable-muxer=mp3 \
	--disable-programs --disable-doc \
	--disable-xlib --disable-dxva2 \
	--disable-postproc --disable-debug $ffmpeg_extra_options
make install
# -j make build randomly fail (VS2017 15.9.11, ffmpeg 4.1.3, 2019/4/20)
#make -j install

#patch configure doesn't work
#sed -i "s/if ! disabled_any asm mmx/if ! disabled_any asm/" configure
# disable these will disable AVX and later instrunctions (mmx only?)
#	--disable-mmx --disable-mmxext \
#	--disable-sse --disable-sse2 --disable-sse3 --disable-ssse3 --disable-sse4 --disable-sse42 \
