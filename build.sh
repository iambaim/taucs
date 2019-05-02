#!/bin/bash

# For linux
mkdir -p external/lib/linux/

ln -s /usr/lib64/libblas.so external/lib/linux/libblas.so
ln -s /usr/lib64/liblapack.so external/lib/linux/liblapack.so

# Configure and make
./configure

make OPT_FLAGS="$RPM_OPT_FLAGS -fPIC" LIBBLAS=-lblas LIBLAPACK=-llapack

