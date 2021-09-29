pushd frida
xz build/frida-android-x86/bin/frida-server
xz build/frida-android-x86/bin/frida-inject
xz build/frida-android-x86/bin/frida-portal
xz build/frida-android-x86/bin/gum-graft
xz build/frida-android-x86/lib/frida/32/frida-gadget.so

releng/devkit.py frida-core android-x86 build/CFrida/android-x86-core
releng/devkit.py frida-gum android-x86 build/CFrida/android-x86-gum
releng/devkit.py frida-gumjs android-x86 build/CFrida/android-x86-gumjs

popd

cd frida/build/CFrida/android-x86-core && tar cJf ../android-x86-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-x86-gum && tar cJf ../android-x86-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-x86-gumjs && tar cJf ../android-x86-gumjs.tar.xz . && cd ../../../..