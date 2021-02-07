pushd frida

export MACOS_CERTID='-'
make core-macos
make core-macos-apple_silicon
make gadget-macos
make python-macos PYTHON=$(which python3.8)
make tools-macos

export base_path=$(pwd)
cd frida-node/
FRIDA=${base_path} npm install
FRIDA=${base_path} npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0
mv prebuilds/frida-v0.0.0-node-v64-darwin-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-node-v64-darwin-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v72-darwin-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-node-v72-darwin-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v83-darwin-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-node-v83-darwin-x64.tar.gz

#FRIDA=${base_path} npm run prebuild -- -t 11.2.0 -r electron
#mv prebuilds/frida-v0.0.0-electron-v85-darwin-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-electron-v85-darwin-x64.tar.gz
ls prebuilds/

popd