#!/bin/bash -e

log_print () {
    echo "#########################################"
    echo $1
    echo "#########################################"
}

# Build everything
log_print "Building fastmatrix ..."
conan create libfastmatrix testuser/develop -o verbose=True
log_print "Building mymaths ..."
conan create libmymaths testuser/develop -o verbose=True
log_print "Building simpleapp ..."
conan create simpleapp testuser/develop -o verbose=True

# Invoke programme
log_print "Copy the path to executable location and invoke."
