Set-ExecutionPolicy -Scope Process -ExecutionPolicy Unrestricted
bash scripts/patch_frida.sh
pushd frida
cd frida-core
git apply --whitespace=warn ..\..\patch\win\frida-core\0001-support_win_build.patch
cd ..\frida-gum
git apply --whitespace=warn ..\..\patch\win\frida-gum\0001-support_win_build.patch
git apply --whitespace=warn ..\..\patch\win\frida-gum\0002-fix_gumjs_build.patch
cd ..
git apply --whitespace=warn ..\patch\win\0001-support_win_build.patch

popd