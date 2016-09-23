#! /bin/bash
set -e

#-----------------------------------------------------------------------------
#
# Get the build requirements with ivy.
#
pushd ivy
ant bootstrap
ant
popd
