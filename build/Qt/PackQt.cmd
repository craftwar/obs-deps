cd bin
"C:\Program Files\7-Zip\7z" a ..\OBS-Qt.7z -mx=9 -myx=9 @..\Qtdll_list.txt
cd ..\plugins
"C:\Program Files\7-Zip\7z" u ..\OBS-Qt.7z -mx=9 -myx=9 @..\Qtdll_list.txt
