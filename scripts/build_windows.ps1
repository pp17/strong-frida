Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
pushd frida
pwsh .\releng\stage-python.ps1
py -3 releng\deps.py sync toolchain windows-x86 build\toolchain-windows
py -3 releng\deps.py sync sdk windows-any build\sdk-windows
msbuild frida.sln /p:Configuration=Release /p:Platform=x64 /p:RuntimeLibrary=MT_StaticRelease /t:frida-core
msbuild frida.sln /p:Configuration=Release /p:Platform=x64 /p:RuntimeLibrary=MT_StaticRelease /t:frida-gadget
msbuild frida.sln /p:Configuration=Release /p:Platform=x64 /p:RuntimeLibrary=MT_StaticRelease /t:frida-server
#msbuild frida.sln /p:Configuration=Release /p:Platform=x64 /p:RuntimeLibrary=MT_StaticRelease /t:frida-python38
#msbuild frida.sln /p:Configuration=Release /p:Platform=x64 /p:RuntimeLibrary=MT_StaticRelease /t:frida-clr
msbuild frida.sln /p:Configuration=Release /p:Platform=Win32 /p:RuntimeLibrary=MT_StaticRelease /t:frida-core
msbuild frida.sln /p:Configuration=Release /p:Platform=Win32 /p:RuntimeLibrary=MT_StaticRelease /t:frida-gadget
msbuild frida.sln /p:Configuration=Release /p:Platform=Win32 /p:RuntimeLibrary=MT_StaticRelease /t:frida-server
#msbuild frida.sln /p:Configuration=Release /p:Platform=Win32 /p:RuntimeLibrary=MD_DynamicRelease /t:frida-python38
#msbuild frida.sln /p:Configuration=Release /p:Platform=Win32 /p:RuntimeLibrary=MD_DynamicRelease /t:frida-clr

cd frida-node
$env:FRIDA = "D:\a\vm\vm\frida" ; npm install
$env:FRIDA = "D:\a\vm\vm\frida" ; npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0
Rename-Item prebuilds\frida-v0.0.0-node-v64-win32-x64.tar.gz frida-node-v64-win32-x64.tar.gz
Rename-Item prebuilds\frida-v0.0.0-node-v72-win32-x64.tar.gz frida-node-v72-win32-x64.tar.gz
Rename-Item prebuilds\frida-v0.0.0-node-v83-win32-x64.tar.gz frida-node-v83-win32-x64.tar.gz

$env:FRIDA = "D:\a\vm\vm\frida" ; npm run prebuild -- -t 11.2.0 -r electron
Rename-Item prebuilds/frida-v0.0.0-electron-v85-win32-x64.tar.gz frida-electron-v85-win32-x64.tar.gz
ls prebuilds/

popd
