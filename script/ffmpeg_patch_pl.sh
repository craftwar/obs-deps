cd /c/projects/$APPVEYOR_PROJECT_NAME/ffmpeg
find . -type f -name '*.c' -type f -print0 | xargs -0 perl -0777 -pi -e 's/(else )?if \(ARCH_(?!X86).+?\)(.|\n)+?;//mng'
find . -type f -name '*.h' -type f -print0 | xargs -0 perl -0777 -pi -e 's/.+?_(aarch64|arm|ppc)\(.|\n+?\);//mng'

# ?! negative lookadhead
# /mng, muti-lines/ global
# use /n no capture group, (?:) is not required
