@rem echo %APPVEYOR_BUILD_FOLDER%
@rem echo $APPVEYOR_BUILD_FOLDER
@rem both = C:\projects\x264
@rem use APPVEYOR_PROJECT_NAME

@rem set zlib_Version=1.2.11
@rem set libpng_Version=1.6.32
set pkg_prefix=%APPVEYOR_BUILD_FOLDER%\packages
set pkg_prefix_win=%APPVEYOR_BUILD_FOLDER%\packages\win64
set pkg_prefix_mingw=/c/projects/%APPVEYOR_PROJECT_NAME%/packages/win64
