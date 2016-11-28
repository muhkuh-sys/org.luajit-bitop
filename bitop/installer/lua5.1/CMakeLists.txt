CMAKE_MINIMUM_REQUIRED(VERSION 3.0)

PROJECT("org.luajit.bitop-lua51-bitop")

INCLUDE(../../../cmake/version.cmake)

SET(INSTALL_WIN32 ${CMAKE_CURRENT_SOURCE_DIR}/../../../build_windows32/lua5.1/bitop/install)
SET(INSTALL_WIN64 ${CMAKE_CURRENT_SOURCE_DIR}/../../../build_windows64/lua5.1/bitop/install)

# Get the project version. Both the WIN32 and the WIN64 folder have the same version file.
INCLUDE(${INSTALL_WIN32}/org.luajit.bitop-bitop.version)
SET(PROJECT_VERSION ${org.luajit.bitop-bitop_VERSION})

SET(CPACK_OUTPUT_FILE_PREFIX targets/jonchki/repository/org/luajit/bitop/${PROJECT_VERSION})
SET(CPACK_INCLUDE_TOPLEVEL_DIRECTORY FALSE)
SET(CPACK_PACKAGE_FILE_NAME "lua5.1-bitop-${PROJECT_VERSION}")

SET(CPACK_GENERATOR "ZIP")
INCLUDE(CPack)


#-----------------------------------------------------------------------------
#
# Install the 32bit files.
#
INSTALL(FILES ${INSTALL_WIN32}/lua_plugins/bit.dll
        DESTINATION windows_x86/lua_plugins
)


#-----------------------------------------------------------------------------
#
# Install the 64bit files.
#
INSTALL(FILES ${INSTALL_WIN64}/lua_plugins/bit.dll
        DESTINATION windows_x64/lua_plugins
)


#-----------------------------------------------------------------------------

INSTALL(FILES install.lua
        DESTINATION .)


CONFIGURE_FILE(bitop.xml
               ${CPACK_OUTPUT_FILE_PREFIX}/lua5.1-bitop-${PROJECT_VERSION}.xml
               @ONLY)
