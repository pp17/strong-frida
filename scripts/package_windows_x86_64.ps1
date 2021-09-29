Push-Location frida
7z.exe a -txz build\frida-server-x86_64.exe.xz build\frida-windows\x64-Release\bin\frida-server.exe
7z.exe a -txz build\frida-inject-x86_64.exe.xz build\frida-windows\x64-Release\bin\frida-inject.exe
7z.exe a -txz build\frida-portal-x86_64.exe.xz build\frida-windows\x64-Release\bin\frida-portal.exe
7z.exe a -txz build\frida-gadget-x86_64.dll.xz build\frida-windows\x64-Release\bin\frida-gadget.dll
7z.exe a -txz build\frida-clr-x86_64.dll.xz build\frida-windows\x64-Release\bin\Frida.dll

py -3 releng\devkit.py frida-core windows-x86_64 build\CFrida\windows-x86_64-core
py -3 releng\devkit.py frida-gum windows-x86_64 build\CFrida\windows-x86_64-gum
py -3 releng\devkit.py frida-gumjs windows-x86_64 build\CFrida\windows-x86_64-gumjs

Pop-Location

cd frida\build\CFrida\windows-x86_64-core && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86_64-core.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86_64-gum && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86_64-gum.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86_64-gumjs && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86_64-gumjs.exe . && cd ..\..\..\..

Push-Location frida
cd build\frida-windows\x64-Release\lib\qt5\qml && 7z.exe a -sfx"7zCon.sfx" -r ..\frida-qml-windows-x86_64.exe .
Pop-Location
