pushd frida

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt install libpython3.8-dev:i386 -y
releng/deps.py roll toolchain linux-x86 --activate
releng/deps.py roll sdk linux-x86
make core-linux-x86

popd