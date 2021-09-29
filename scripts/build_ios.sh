pushd frida
export IOS_CERTID='-'
make core-ios
make gadget-ios
make deb-ios
popd