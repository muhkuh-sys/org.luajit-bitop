cmake_minimum_required(VERSION 3.7)

PROJECT("org.luajit-bitop")

INCLUDE(cmake/version.cmake)
INCLUDE(cmake/platform.cmake)
MESSAGE("Building for: ${JONCHKI_PLATFORM}")

#----------------------------------------------------------------------------
#
# Include the projects in the subdirectories.
# NOTE: build the external components first. Many parts depend on them.
#

ADD_SUBDIRECTORY(bitop)


#----------------------------------------------------------------------------

