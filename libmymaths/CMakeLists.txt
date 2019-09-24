#############################################################
##  MYMATHS: High-level maths lib depending on FASTMATRIX  ##
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
project(mymaths CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS KEEP_RPATHS)

#############################################################
# Compiling.
#############################################################
add_library(${PROJECT_NAME} SHARED mymaths.cpp)

target_include_directories(${PROJECT_NAME} PUBLIC
    ${CONAN_INCLUDE_DIRS_FASTMATRIX}
)

target_link_directories(${PROJECT_NAME} PRIVATE
    ${CONAN_LIB_DIRS_FASTMATRIX}
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE

    INSTALL_RPATH ${CONAN_LIB_DIRS_FASTMATRIX}
)

#############################################################
# Linking
#############################################################
target_link_libraries(${PROJECT_NAME}
    ${CONAN_LIBS_FASTMATRIX}
)
