pushd frida
xz build/frida-linux-arm64/bin/frida-server
xz build/frida-linux-arm64/bin/frida-inject
xz build/frida-linux-arm64/bin/frida-portal
xz build/frida-linux-arm64/lib/frida/64/frida-gadget.so

releng/devkit.py frida-core linux-arm64 build/CFrida/linux-arm64-core
releng/devkit.py frida-gum linux-arm64 build/CFrida/linux-arm64-gum
releng/devkit.py frida-gumjs linux-arm64 build/CFrida/linux-arm64-gumjs

popd

cd frida/build/CFrida/linux-arm64-core && tar cJf ../linux-arm64-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/linux-arm64-gum && tar cJf ../linux-arm64-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/linux-arm64-gumjs && tar cJf ../linux-arm64-gumjs.tar.xz . && cd ../../../..
