pushd frida
xz build/frida-android-arm/bin/frida-server
xz build/frida-android-arm/bin/frida-inject
xz build/frida-android-arm/bin/frida-portal
xz build/frida-android-arm/bin/gum-graft
xz build/frida-android-arm/lib/frida/32/frida-gadget.so

releng/devkit.py frida-core android-arm build/CFrida/android-arm-core
releng/devkit.py frida-gum android-arm build/CFrida/android-arm-gum
releng/devkit.py frida-gumjs android-arm build/CFrida/android-arm-gumjs

popd

cd frida/build/CFrida/android-arm-core && tar cJf ../android-arm-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-arm-gum && tar cJf ../android-arm-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-arm-gumjs && tar cJf ../android-arm-gumjs.tar.xz . && cd ../../../..