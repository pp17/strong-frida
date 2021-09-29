pushd frida
xz build/frida-linux-x86/bin/frida-server
xz build/frida-linux-x86/bin/frida-inject
xz build/frida-linux-x86/bin/frida-portal
xz build/frida-linux-x86/lib/frida/32/frida-gadget.so

releng/devkit.py frida-core linux-x86 build/CFrida/linux-x86-core
releng/devkit.py frida-gum linux-x86 build/CFrida/linux-x86-gum
releng/devkit.py frida-gumjs linux-x86 build/CFrida/linux-x86-gumjs

popd

cd frida/build/CFrida/linux-x86-core && tar cJf ../linux-x86-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/linux-x86-gum && tar cJf ../linux-x86-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/linux-x86-gumjs && tar cJf ../linux-x86-gumjs.tar.xz . && cd ../../../..