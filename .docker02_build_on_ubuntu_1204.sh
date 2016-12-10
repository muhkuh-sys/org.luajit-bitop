#! /bin/bash
set -e

# Get the project directory.
PRJDIR=`pwd`

# Make sure that the "build" folder exists.
# NOTE: do not remove it, maybe there are already components.
mkdir -p ${PRJDIR}/build

# Start the container and get the ID.
ID=`docker run --detach --interactive --volume ${PRJDIR}:/tmp/work mbs_ubuntu_1204 /bin/bash`

# Update the package list to prevent "not found" messages.
docker exec ${ID} bash -c 'apt-get update --assume-yes'

docker exec ${ID} bash -c 'apt-get install --assume-yes lua5.1 lua51-mhash lua-penlight lua-expat lua-logging lua-curl lua-zip lua-filesystem'
#docker exec ${ID} bash -c 'git clone https://github.com/muhkuh-sys/org.muhkuh.lua-jonchki.git /tmp/jonchki'

# Build the 32bit version.
docker exec ${ID} bash -c 'cd /tmp/work && bash .build03_linux32.sh'
docker exec ${ID} bash -c 'tar --create --file /tmp/work/build/build_ubuntu_1204_x86.tar.gz --gzip --directory /tmp/work/build_linux32/lua5.1/bitop/install .'
docker exec ${ID} bash -c 'chown `stat -c %u:%g /tmp/work` /tmp/work/build/build_ubuntu_1204_x86.tar.gz'

# Build the 64bit version.
docker exec ${ID} bash -c 'cd /tmp/work && bash .build04_linux64.sh'
docker exec ${ID} bash -c 'tar --create --file /tmp/work/build/build_ubuntu_1204_x86_64.tar.gz --gzip --directory /tmp/work/build_linux64/lua5.1/bitop/install .'
docker exec ${ID} bash -c 'chown `stat -c %u:%g /tmp/work` /tmp/work/build/build_ubuntu_1204_x86_64.tar.gz'

# Stop and remove the container.
docker stop --time 0 ${ID}
docker rm ${ID}