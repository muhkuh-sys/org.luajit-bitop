#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Build all artefacts.
#
pushd build
rm -rf org.luajit-lua5.1-bitop
rm -rf org.luajit-lua5.2-bitop
rm -rf lua5.1
rm -rf lua5.2

mkdir org.luajit-lua5.1-bitop
mkdir org.luajit-lua5.2-bitop
mkdir -p lua5.1/windows_x86
mkdir -p lua5.1/windows_x86_64
mkdir -p lua5.1/ubuntu_1404_x86
mkdir -p lua5.1/ubuntu_1404_x86_64
mkdir -p lua5.1/ubuntu_1604_x86
mkdir -p lua5.1/ubuntu_1604_x86_64
mkdir -p lua5.1/ubuntu_1610_x86
mkdir -p lua5.1/ubuntu_1610_x86_64
mkdir -p lua5.1/ubuntu_1704_x86
mkdir -p lua5.1/ubuntu_1704_x86_64
mkdir -p lua5.2/windows_x86
mkdir -p lua5.2/windows_x86_64
mkdir -p lua5.2/ubuntu_1404_x86
mkdir -p lua5.2/ubuntu_1404_x86_64
mkdir -p lua5.2/ubuntu_1604_x86
mkdir -p lua5.2/ubuntu_1604_x86_64
mkdir -p lua5.2/ubuntu_1610_x86
mkdir -p lua5.2/ubuntu_1610_x86_64
mkdir -p lua5.2/ubuntu_1704_x86
mkdir -p lua5.2/ubuntu_1704_x86_64



tar --extract --directory lua5.1/windows_x86 --file build_windows_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/windows_x86 --file build_windows_x86_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/windows_x86_64 --file build_windows_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/windows_x86_64 --file build_windows_x86_64_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1404_x86 --file build_ubuntu_1404_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1404_x86 --file build_ubuntu_1404_x86_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1404_x86_64 --file build_ubuntu_1404_x86_64_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1604_x86 --file build_ubuntu_1604_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1604_x86 --file build_ubuntu_1604_x86_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1604_x86_64 --file build_ubuntu_1604_x86_64_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1610_x86 --file build_ubuntu_1610_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1610_x86 --file build_ubuntu_1610_x86_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1610_x86_64 --file build_ubuntu_1610_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1610_x86_64 --file build_ubuntu_1610_x86_64_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1704_x86 --file build_ubuntu_1704_x86_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1704_x86 --file build_ubuntu_1704_x86_lua5.2.tar.gz --gzip

tar --extract --directory lua5.1/ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64_lua5.1.tar.gz --gzip
tar --extract --directory lua5.2/ubuntu_1704_x86_64 --file build_ubuntu_1704_x86_64_lua5.2.tar.gz --gzip

popd


pushd build/org.luajit-lua5.1-bitop
cmake -DCMAKE_INSTALL_PREFIX="" ../../bitop/installer/lua5.1
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/luajit/bitop/*/lua5.1-bitop-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/luajit/bitop/*/lua5.1-bitop-*.tar.xz
popd

pushd build/org.luajit-lua5.2-bitop
cmake -DCMAKE_INSTALL_PREFIX="" ../../bitop/installer/lua5.2
make
make package
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/luajit/bitop/*/lua5.2-bitop-*.xml
python2.7 ../../cmake/tools/generate_hash.py targets/jonchki/repository/org/luajit/bitop/*/lua5.2-bitop-*.tar.xz
popd
