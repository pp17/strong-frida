pushd frida
xz build/frida-linux-x86_64/bin/frida-server
xz build/frida-linux-x86_64/bin/frida-inject
xz build/frida-linux-x86_64/bin/frida-portal
xz build/frida-linux-x86_64/lib/frida/64/frida-gadget.so

releng/devkit.py frida-core linux-x86_64 build/CFrida/linux-x86_64-core
releng/devkit.py frida-gum linux-x86_64 build/CFrida/linux-x86_64-gum
releng/devkit.py frida-gumjs linux-x86_64 build/CFrida/linux-x86_64-gumjs

popd

cd frida/build/CFrida/linux-x86_64-core && tar cJf ../linux-x86_64-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/linux-x86_64-gum && tar cJf ../linux-x86_64-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/linux-x86_64-gumjs && tar cJf ../linux-x86_64-gumjs.tar.xz . && cd ../../../..

cd frida/build/frida-linux-x86_64/lib/qt5/qml && tar cJf ../frida-qml-linux-x86_64.tar.xz . && cd ../../../../../..
