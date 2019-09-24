#############################################################
##   MYMATHS: Simple maths lib that depends on FASTMATRIX  ##
#                                                           #
# This is a simple example of how libraries should be built #
# in order to                                               #
# 1) encapsulate dependencies correctly,                    #
# 2) locate them during runtime with relative run-paths.    #
#                                                           #
# Author: Thomas Arvanitidis                                #
# URL:    https://github.com/tarvanitidis/rpath_tutorial    #
#                                                           #
#############################################################
cmake_minimum_required(VERSION 2.8)
project(mymaths CXX)
set(CMAKE_VERBOSE_MAKEFILE TRUE)

#############################################################
# Configuring
#############################################################
# Point to FindFASTMATRIX.cmake, used by find_package().
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/../cmake_modules")

set(FASTMATRIX_ROOT "${CMAKE_CURRENT_SOURCE_DIR}/../libfastmatrix")

# Populate FASTMATRIX_INCLUDE_DIR and FASTMATRIX_LIBRARY.
find_package(FASTMATRIX REQUIRED)

#############################################################
# Building
#############################################################
include_directories("${FASTMATRIX_INCLUDE_DIR}")

add_library(${PROJECT_NAME} SHARED mymaths.cpp)

if(APPLE)
    set(TOKEN "@loader_path")
elseif(UNIX AND NOT APPLE)
    set(TOKEN "$ORIGIN")
endif()

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE

    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_NAME_DIR "@rpath"  # Necessary prior CMP0042 introduction.
    INSTALL_RPATH "${TOKEN}/../libfastmatrix"
)

#############################################################
# Linking
#############################################################
target_link_libraries(${PROJECT_NAME} ${FASTMATRIX_LIBRARY})
