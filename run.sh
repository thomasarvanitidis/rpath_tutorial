#!/bin/bash -e

log_print () {
    echo "#########################################"
    echo $1
    echo "#########################################"
}

# Build everything
log_print "Building fastmatrix ..."
cd libfastmatrix && mkdir -p build && cd build && cmake .. && make && cd ../..
log_print "Building mymaths ..."
cd libmymaths    && mkdir -p build && cd build && cmake .. && make && cd ../..
log_print "Building simpleapp ..."
cd simpleapp     && mkdir -p build && cd build && cmake .. && make && cd ../..

# Invoke programme
log_print "Run simpleapp"
./simpleapp/build/simpleapp
