#!/bin/bash -e

log_print () {
    echo "#########################################"
    echo $1
    echo "#########################################"
}

# Build everything
log_print "Building fastmatrix ..."
cd libfastmatrix && cmake . && make && cd ..
log_print "Building mymaths ..."
cd libmymaths    && cmake . && make && cd ..
log_print "Building simpleapp ..."
cd simpleapp     && cmake . && make && cd ..

# Invoke programme
log_print "Run simpleapp"
./simpleapp/simpleapp
