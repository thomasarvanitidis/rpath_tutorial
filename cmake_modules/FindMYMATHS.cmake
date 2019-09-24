# Author: Thomas Arvanitidis
# URL:    https://github.com/tarvanitidis/rpath_tutorial

find_path(MYMATHS_INCLUDE_DIR
    NAMES mymaths/mymaths_api.h
    PATHS ${MYMATHS_ROOT}
    PATH_SUFFIXES include
    NO_DEFAULT_PATH
)

find_library(MYMATHS_LIBRARY
    NAMES mymaths
    PATHS ${MYMATHS_ROOT}
    PATH_SUFFIXES lib
    NO_DEFAULT_PATH
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(MYMATHS
    REQUIRED_VARS MYMATHS_LIBRARY MYMATHS_INCLUDE_DIR
)
