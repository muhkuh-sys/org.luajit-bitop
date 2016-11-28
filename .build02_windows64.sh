#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build the windows64 version.
#
rm -rf build_windows64
mkdir build_windows64

mkdir build_windows64/lua5.1
pushd build_windows64/lua5.1
cmake -DBUILDCFG_LUA_VERSION="5.1" -DCMAKE_INSTALL_PREFIX="" -DCMAKE_C_FLAGS=-m64 -DCMAKE_CXX_FLAGS=-m64 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=x86_64-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=x86_64-w64-mingw32-g++ -DCMAKE_RC_COMPILER=x86_64-w64-mingw32-windres ../..
make
popd
