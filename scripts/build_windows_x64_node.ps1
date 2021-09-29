Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
Push-Location frida

$env:FRIDA=Get-Location
Set-Location frida-node
npm install
npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0 -t 16.0.0
Rename-Item prebuilds\frida-v0.0.0-node-v64-win32-x64.tar.gz frida-node-v64-win32-x64.tar.gz
Rename-Item prebuilds\frida-v0.0.0-node-v72-win32-x64.tar.gz frida-node-v72-win32-x64.tar.gz
Rename-Item prebuilds\frida-v0.0.0-node-v83-win32-x64.tar.gz frida-node-v83-win32-x64.tar.gz
Rename-Item prebuilds\frida-v0.0.0-node-v93-win32-x64.tar.gz frida-node-v93-win32-x64.tar.gz

npm run prebuild -- -t 13.0.0 -r electron
Rename-Item prebuilds/frida-v0.0.0-electron-v89-win32-x64.tar.gz frida-electron-v89-win32-x64.tar.gz
ls prebuilds/

Pop-Location
