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
set(MYMATHS_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../libmymaths")

# Populate MYMATHS_INCLUDE_DIR and MYMATHS_LIBRARY.
find_package(MYMATHS REQUIRED)

#############################################################
# Building
#############################################################
include_directories(${MYMATHS_INCLUDE_DIR})

add_executable(${PROJECT_NAME} simpleapp.cpp)

if(APPLE)
    set(TOKEN "@executable_path")
elseif(UNIX AND NOT APPLE)
    set(TOKEN "$ORIGIN")
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE

    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_RPATH "${TOKEN}/../libmymaths"
)

#############################################################
# Linking
#############################################################
target_link_libraries(${PROJECT_NAME} ${MYMATHS_LIBRARY})
