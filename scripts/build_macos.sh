pushd frida

# export DEPOT_TOOLS_BOOTSTRAP_PYTHON3=0
# releng/deps.py roll toolchain macos-x86_64 --activate
# releng/deps.py roll toolchain macos-arm64
# releng/deps.py roll toolchain macos-arm64e

export MACOS_CERTID='-'
export SDKROOT=//Library/Developer/CommandLineTools/SDKs/MacOSX11.1.sdk
make core-macos
make core-macos-apple_silicon
make gadget-macos
make python-macos PYTHON=$(which python3.8)
make tools-macos

export base_path=$(pwd)
export FRIDA=${base_path}

cd frida-node/
# https://github.com/atom/node-keytar/issues/339
brew install gnu-sed
gsed -i 's/-std=c++11/-std=c++14/g' binding.gyp

npm install
npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0 -t 16.0.0
mv prebuilds/frida-v0.0.0-node-v64-darwin-x64.tar.gz prebuilds/frida-node-v64-darwin-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v72-darwin-x64.tar.gz prebuilds/frida-node-v72-darwin-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v83-darwin-x64.tar.gz prebuilds/frida-node-v83-darwin-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v93-darwin-x64.tar.gz prebuilds/frida-node-v93-darwin-x64.tar.gz

npm run prebuild -- -t 13.0.0 -r electron
mv prebuilds/frida-v0.0.0-electron-v89-darwin-x64.tar.gz prebuilds/frida-electron-v89-darwin-x64.tar.gz

# https://github.com/atom/node-keytar/issues/346
export npm_target_arch=arm64
export npm_config_arch=arm64
npm install
# npx node-gyp rebuild --arch=arm64
# FIXME: build empty files!!!
npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0 -a arm64
ls prebuilds/
mv prebuilds/frida-v0.0.0-node-v64-darwin-arm64.tar.gz prebuilds/frida-node-v64-darwin-arm64.tar.gz
mv prebuilds/frida-v0.0.0-node-v72-darwin-arm64.tar.gz prebuilds/frida-node-v72-darwin-arm64.tar.gz
mv prebuilds/frida-v0.0.0-node-v83-darwin-arm64.tar.gz prebuilds/frida-node-v83-darwin-arm64.tar.gz

npm run prebuild -- -t 13.0.0 -r electron -a arm64
ls prebuilds/
mv prebuilds/frida-v0.0.0-electron-v89-darwin-arm64.tar.gz prebuilds/frida-electron-v89-darwin-arm64.tar.gz

cd ..

popd

pushd frida
brew install qt@5

cd build/tmp-macos-x86_64
rm -rf frida-qml && mkdir frida-qml && cd frida-qml && /usr/local/opt/qt@5/bin/qmake QMAKE_TARGET.arch=x86_64 ../../../frida-qml

cd ../../..
make -C build/tmp-macos-x86_64/frida-qml install
strip -Sx build/frida-macos-x86_64/lib/qt5/qml/Frida/libfrida-qml.dylib

popd
