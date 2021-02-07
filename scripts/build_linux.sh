pushd frida

sudo apt install libpython3.8-dev
releng/deps.py roll toolchain linux-x86_64 --activate
releng/deps.py roll sdk linux-x86_64
make core-linux-x86_64
make python-linux-x86_64 PYTHON=$(which python3.8)
export base_path=$(pwd)
cd frida-python
FRIDA_VERSION=${FRIDA_VERSION} FRIDA_EXTENSION=${base_path}/build/frida-linux-x86_64/lib/python3.8/site-packages/_frida.so fpm --iteration=1.ubuntu-focal --maintainer="Ole André Vadla Ravnås <oleavr@frida.re>" --vendor=Frida --category=Libraries --python-bin=$(which python3.8) --python-package-name-prefix=python3 --python-install-bin=/usr/bin --python-install-lib=/usr/lib/python3.8/dist-packages -s python -t deb setup.py
# frida-python/python3-frida_14.2.11-1.ubuntu-focal_amd64.deb
ls
cd ../frida-tools/
make
FRIDA_VERSION=${FRIDA_VERSION} FRIDA_EXTENSION=${base_path}/build/frida-linux-x86_64/lib/python3.8/site-packages/_frida.so fpm --iteration=1.ubuntu-focal --maintainer="Ole André Vadla Ravnås <oleavr@frida.re>" --vendor=Frida --category=Libraries --python-bin=$(which python3.8) --python-package-name-prefix=python3 --python-install-bin=/usr/bin --python-install-lib=/usr/lib/python3.8/dist-packages -s python -t deb setup.py
# python3-frida-tools_9.1.0-1.ubuntu-focal_all.deb
ls

cd ../frida-node/
FRIDA=${base_path} npm install
FRIDA=${base_path} npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0
mv prebuilds/frida-v0.0.0-node-v64-linux-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-node-v64-linux-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v72-linux-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-node-v72-linux-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v83-linux-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-node-v83-linux-x64.tar.gz

FRIDA=${base_path} npm run prebuild -- -t 11.2.0 -r electron
mv prebuilds/frida-v0.0.0-electron-v85-linux-x64.tar.gz prebuilds/frida-v${FRIDA_VERSION}-electron-v85-linux-x64.tar.gz
ls prebuilds/
cd ..

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt install libpython3.8-dev:i386
releng/deps.py roll toolchain linux-x86 --activate
releng/deps.py roll sdk linux-x86
make core-linux-x86
# make python-linux-x86 PYTHON=$(which python3.8)
# make node-linux-x86 NODE=/usr/local/bin/node

sudo apt install binutils-aarch64-linux-gnu gcc-aarch64-linux-gnu g++-aarch64-linux-gnu
releng/deps.py roll toolchain linux-arm64 --activate
releng/deps.py roll sdk linux-arm64
releng/deps.py roll toolchain linux-armhf
releng/deps.py roll sdk linux-armhf
make core-linux-arm64
#make python-linux-arm64 PYTHON=$(which python3.8)
#make node-linux-arm64 NODE=/usr/local/bin/node

popd