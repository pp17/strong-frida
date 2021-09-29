pushd frida
make core-android-arm64
make gum-android-arm64
# building python bindings
# FIXME: Python.h:44:10: fatal error: 'crypt.h' file not found
# make build/tmp-android-arm64/frida-python3.8/.frida-stamp PYTHON_NAME=python3.8 PYTHON_INCDIR=$(python3.8 -c 'from distutils import sysconfig; import sys; sys.stdout.write(sysconfig.get_python_inc())')
popd