set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_SYSTEM_PROCESSOR i686)

# set VERBOSE if needed
# Source https://stackoverflow.com/questions/2670121/using-cmake-with-gnu-make-how-can-i-see-the-exact-commands
#set(CMAKE_VERBOSE_MAKEFILE ON)

set(tools /usr/bin)
set(CMAKE_C_COMPILER ${tools}/i686-w64-mingw32-gcc)
set(CMAKE_CXX_COMPILER ${tools}/i686-w64-mingw32-g++)
set(CMAKE_RC_COMPILER ${tools}/i686-w64-mingw32-windres)

# Source: https://stackoverflow.com/questions/11423313/cmake-cross-compiling-c-flags-from-toolchain-file-ignored
UNSET(CMAKE_C_FLAGS CACHE)
UNSET(CMAKE_CXX_FLAGS CACHE)
set(CMAKE_C_FLAGS "-m32" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-m32" CACHE STRING "" FORCE)
