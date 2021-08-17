pushd frida
7z.exe a -txz build\frida-server-x86_64.exe.xz build\frida-windows\x64-Release\bin\frida-server.exe
7z.exe a -txz build\frida-gadget-x86_64.dll.xz build\frida-windows\x64-Release\bin\frida-gadget.dll
7z.exe a -txz build\frida-server-x86.exe.xz build\frida-windows\Win32-Release\bin\frida-server.exe
7z.exe a -txz build\frida-gadget-x86.dll.xz build\frida-windows\Win32-Release\bin\frida-gadget.dll

py -3 releng/devkit.py frida-core windows-x86 build\CFrida\windows-x86-core
py -3 releng\devkit.py frida-gum windows-x86 build\CFrida\windows-x86-gum
py -3 releng\devkit.py frida-gumjs windows-x86 build\CFrida\windows-x86-gumjs
py -3 releng\devkit.py frida-core windows-x86_64 build\CFrida\windows-x86_64-core
py -3 releng\devkit.py frida-gum windows-x86_64 build\CFrida\windows-x86_64-gum
py -3 releng\devkit.py frida-gumjs windows-x86_64 build\CFrida\windows-x86_64-gumjs

popd

# Copy-Item "c:\Program Files\7-Zip\7zCon.sfx" "C:\ProgramData\Chocolatey\bin"
cd frida\build\CFrida\windows-x86-core && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86-core.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86-gum && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86-gum.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86-gumjs && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86-gumjs.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86_64-core && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86_64-core.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86_64-gum && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86_64-gum.exe . && cd ..\..\..\..
cd frida\build\CFrida\windows-x86_64-gumjs && 7z.exe a -sfx"7zCon.sfx" -r ..\windows-x86_64-gumjs.exe . && cd ..\..\..\..