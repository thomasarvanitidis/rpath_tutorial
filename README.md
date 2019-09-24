# RPATH TUTORIAL PROJECT

This is an attempt to reproduce a realistic example of a complex system where the programme depends on shared libraries, and these libraries, in turn, depend on other shared libraries. The objective is to understand the correct use of rpaths so that programmes compile and, most importantly, link successfully during the build step. Also, to ensure that the end result can operate and locate all the symbols required at the locations defined in the build.

## Structure

* libfastmatrix -  Shared library with no other dependencies.
* libmymaths    -  High-level implementation of maths routines, implementing fastmatrix's efficient routines.
* simpleapp     -  Programme that links to libmymaths and indirectly uses libfastmatrix's routines.

## How To Use

* ` pip install conan==1.13.0 ` . Ensure conan is installed in your environment.
* ` ./run.sh ` . Builds all software.
* ` ./cleanup.sh ` . Remove built and cached software.
