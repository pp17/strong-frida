pushd frida
xz build/frida-android-arm64/bin/frida-server
xz build/frida-android-arm64/bin/frida-inject
xz build/frida-android-arm64/bin/frida-portal
xz build/frida-android-arm64/bin/gum-graft
xz build/frida-android-arm64/lib/frida/64/frida-gadget.so

releng/devkit.py frida-core android-arm64 build/CFrida/android-arm64-core
releng/devkit.py frida-gum android-arm64 build/CFrida/android-arm64-gum
releng/devkit.py frida-gumjs android-arm64 build/CFrida/android-arm64-gumjs

popd

cd frida/build/CFrida/android-arm64-core && tar cJf ../android-arm64-core.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-arm64-gum && tar cJf ../android-arm64-gum.tar.xz . && cd ../../../..
cd frida/build/CFrida/android-arm64-gumjs && tar cJf ../android-arm64-gumjs.tar.xz . && cd ../../../..