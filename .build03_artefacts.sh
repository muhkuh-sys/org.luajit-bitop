#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
rm -rf build
mkdir build

mkdir build/org.luajit.bitop-lua5.1-bitop
pushd build/org.luajit.bitop-lua5.1-bitop
cmake -DCMAKE_INSTALL_PREFIX="" ../../bitop/installer/lua5.1
make
make package
popd
