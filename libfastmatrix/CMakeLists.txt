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
cmake_minimum_required(VERSION 3.14)
project(fastmatrix CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS)

############################################################
# Compiling.
############################################################
add_library(${PROJECT_NAME} SHARED fastmatrix.cpp)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE
)
