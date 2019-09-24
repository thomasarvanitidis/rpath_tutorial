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
cmake_minimum_required(VERSION 3.14)
project(simpleapp CXX)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup(TARGETS KEEP_RPATHS)

#############################################################
# Compiling.
#############################################################
add_executable(${PROJECT_NAME} simpleapp.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE
    ${CONAN_INCLUDE_DIRS_MYMATHS}
)

target_link_directories(${PROJECT_NAME} PRIVATE
    ${CONAN_LIB_DIRS_MYMATHS}
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    CXX_STANDARD 11
    CXX_EXTENSIONS FALSE

    INSTALL_RPATH ${CONAN_LIB_DIRS_MYMATHS}
)

#############################################################
# Linking
#############################################################
target_link_libraries(${PROJECT_NAME}
    ${CONAN_LIBS_MYMATHS}
)
