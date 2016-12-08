#! /bin/bash
set -e

PRJ_DIR=${PWD}

# This is the path to the jonchki tool.
JONCHKI=/tmp/jonchki/jonchki.lua

#-----------------------------------------------------------------------------
#
# Build the windows32 version.
#
rm -rf build_windows32
mkdir build_windows32

mkdir build_windows32/lua5.1
mkdir build_windows32/lua5.1/build_requirements

pushd build_windows32/lua5.1/build_requirements
cmake -DBUILDCFG_ONLY_JONCHKI_CFG="ON" -DCMAKE_INSTALL_PREFIX="" -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=i686-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=i686-w64-mingw32-g++ -DCMAKE_RC_COMPILER=i686-w64-mingw32-windres ${PRJ_DIR}
make
lua5.1 ${JONCHKI} --verbose debug --syscfg ${PRJ_DIR}/jonchki/jonchkisys.cfg --prjcfg ${PRJ_DIR}/jonchki/jonchkicfg.xml --target windows_32 --build-dependencies bitop/lua5.1-bitop-1.0.2.1.xml
popd

pushd build_windows32/lua5.1
cmake -DBUILDCFG_LUA_USE_SYSTEM="OFF" -DBUILDCFG_LUA_VERSION="5.1" -DCMAKE_INSTALL_PREFIX="" -DCMAKE_C_FLAGS=-m32 -DCMAKE_CXX_FLAGS=-m32 -DCMAKE_SYSTEM_NAME=Windows -DCMAKE_C_COMPILER=i686-w64-mingw32-gcc -DCMAKE_CXX_COMPILER=i686-w64-mingw32-g++ -DCMAKE_RC_COMPILER=i686-w64-mingw32-windres ${PRJ_DIR}
make
popd
