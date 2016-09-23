#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build the windows32 version.
#
rm -rf build_windows32
mkdir build_windows32
pushd build_windows32
cmake -DCMAKE_INSTALL_PREFIX="" -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=i686-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=i686-w64-mingw32-g++ -DCMAKE_RC_COMPILER=i686-w64-mingw32-windres ..
make
popd
