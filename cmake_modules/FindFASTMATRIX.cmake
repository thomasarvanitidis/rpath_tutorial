# Author: Thomas Arvanitidis
# URL:    https://github.com/tarvanitidis/rpath_tutorial

find_path(FASTMATRIX_INCLUDE_DIR
    NAMES fastmatrix.h
    PATHS ${FASTMATRIX_ROOT}
    NO_DEFAULT_PATH
)

find_library(FASTMATRIX_LIBRARY
    NAMES fastmatrix
    PATHS ${FASTMATRIX_ROOT}
    NO_DEFAULT_PATH
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(FASTMATRIX
    REQUIRED_VARS FASTMATRIX_LIBRARY FASTMATRIX_INCLUDE_DIR
)
