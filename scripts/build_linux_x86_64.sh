pushd frida

sudo apt install libpython3.8-dev
releng/deps.py roll toolchain linux-x86_64 --activate
releng/deps.py roll sdk linux-x86_64
make core-linux-x86_64
make python-linux-x86_64 PYTHON=$(which python3.8)
export base_path=$(pwd)
cd frida-python
export FRIDA_EXTENSION=${base_path}/build/frida-linux-x86_64/lib/python3.8/site-packages/_frida.so

fpm --iteration=1.ubuntu-focal --maintainer="Ole André Vadla Ravnås <oleavr@frida.re>" --vendor=Frida --category=Libraries --python-bin=$(which python3.8) --python-package-name-prefix=python3 --python-install-bin=/usr/bin --python-install-lib=/usr/lib/python3.8/dist-packages -s python -t deb setup.py
# frida-python/python3-frida_14.2.11-1.ubuntu-focal_amd64.deb
ls

cd ../frida-tools/
make
fpm --iteration=1.ubuntu-focal --maintainer="Ole André Vadla Ravnås <oleavr@frida.re>" --vendor=Frida --category=Libraries --python-bin=$(which python3.8) --python-package-name-prefix=python3 --python-install-bin=/usr/bin --python-install-lib=/usr/lib/python3.8/dist-packages -s python -t deb setup.py
# python3-frida-tools_9.1.0-1.ubuntu-focal_all.deb
ls

cd ../frida-node/
FRIDA=${base_path} npm install
FRIDA=${base_path} npm run prebuild -- -t 10.0.0 -t 12.0.0 -t 14.0.0 -t 16.0.0
ls prebuilds/
mv prebuilds/frida-v0.0.0-node-v64-linux-x64.tar.gz prebuilds/frida-node-v64-linux-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v72-linux-x64.tar.gz prebuilds/frida-node-v72-linux-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v83-linux-x64.tar.gz prebuilds/frida-node-v83-linux-x64.tar.gz
mv prebuilds/frida-v0.0.0-node-v93-linux-x64.tar.gz prebuilds/frida-node-v93-linux-x64.tar.gz

FRIDA=${base_path} npm run prebuild -- -t 13.0.0 -r electron
ls prebuilds/
mv prebuilds/frida-v0.0.0-electron-v89-linux-x64.tar.gz prebuilds/frida-electron-v89-linux-x64.tar.gz
cd ..

# LD=/usr/bin/ld.gold make python-linux-x86_64 PYTHON=$(which python3.8)
# ls build/frida-linux-x86_64/lib/python3.8/site-packages

popd