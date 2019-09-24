#############################################################
##  FASTMATRIX: Implements a super fast addition routine.  ##
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
project(fastmatrix CXX)
set(CMAKE_VERBOSE_MAKEFILE TRUE)

############################################################
# Building
############################################################
add_library(${PROJECT_NAME} SHARED fastmatrix.cpp)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE

    BUILD_WITH_INSTALL_RPATH TRUE
    INSTALL_NAME_DIR "@rpath"  # Necessary prior CMP0042 introduction.
)
