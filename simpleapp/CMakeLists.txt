#############################################################
##       SIMPLEAPP: Simple app that links to mymaths       ##
#                                                           #
# This is a simple example of how applications should be    #
# built in order to locate dependencies during runtime with #
# relative run-paths.                                       #
#                                                           #
# Author: Thomas Arvanitidis                                #
# URL:    https://github.com/tarvanitidis/rpath_tutorial    #
#                                                           #
#############################################################
cmake_minimum_required(VERSION 2.8)
project(simpleapp CXX)
set(CMAKE_VERBOSE_MAKEFILE TRUE)

# ----------------------
# Configuring
# ----------------------
# Point to FindMYMATHS.cmake, used by find_package().
set(CMAKE_MODULE_PATH  "${CMAKE_CURRENT_SOURCE_DIR}/../cmake_modules")

# Provide MYMATHS_ROOT, required in FindMYMATHS.cmake.
set(MYMATHS_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../libmymaths/build")

# Populate MYMATHS_INCLUDE_DIR and MYMATHS_LIBRARY.
find_package(MYMATHS REQUIRED)

#############################################################
# Building
#############################################################
include_directories(${MYMATHS_INCLUDE_DIR})

add_executable(${PROJECT_NAME} simpleapp.cpp)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE

    BUILD_WITH_INSTALL_RPATH TRUE
    # Desired result, libfastmatrix agnostic
    INSTALL_RPATH "@executable_path/../../libmymaths/build"

    # # # Fix 1, -rpath-link (linux-specific ld option)
    # LINK_FLAGS "-Wl,-rpath-link,${CMAKE_CURRENT_SOURCE_DIR}/../libfastmatrix/"

    # # # Fix 2, additional (unecessary for macOS) rpath, overwrites line 47
    # # INSTALL_RPATH "${TOKEN}/../libmymaths;${CMAKE_CURRENT_SOURCE_DIR}/../libfastmatrix"
)

#############################################################
# Linking
#############################################################
target_link_libraries(${PROJECT_NAME} ${MYMATHS_LIBRARY})
