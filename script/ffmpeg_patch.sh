ffmpeg="ffmpeg/libavutil"
cd /c/projects/$APPVEYOR_PROJECT_NAME/
patch $ffmpeg/cpu.c patch/$ffmpeg/cpu.c.patch
patch $ffmpeg/float_dsp.c patch/$ffmpeg/float_dsp.c.patch
