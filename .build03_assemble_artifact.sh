#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Assemble the artifacts.
#
rm -rf build
mkdir build
pushd build
cmake ../installer/ivy
make
make install
popd
