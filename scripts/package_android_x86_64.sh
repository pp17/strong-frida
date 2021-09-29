pushd frida
xz build/frida-android-x86_64/bin/frida-server
xz build/frida-android-x86_64/bin/frida-inject
xz build/frida-android-x86_64/bin/frida-portal
xz build/frida-android-x86_64/bin/gum-graft
xz build/frida-android-x86_64/lib/frida/64/frida-gadget.so

releng/devkit.py frida-core android-x86_64 build/CFrida/android-x86_64-core
releng/devkit.py frida-gum android-x86_64 build/CFrida/android-x86_64-gum
releng/devkit.py frida-gumjs android-x86_64 build/CFrida/android-x86_64-gumjs

popd

cd frida/build/CFrida/android-x86_64-core && tar cJf ../android-x86_64-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-x86_64-gum && tar cJf ../android-x86_64-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-x86_64-gumjs && tar cJf ../android-x86_64-gumjs.tar.xz . && cd ../../../..