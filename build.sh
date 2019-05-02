#!/bin/bash

wget https://m.tau.ac.il/~stoledo/taucs/2.2/taucs.tgz

tar -zxvf taucs.tgz

patch -p1 < taucs-2.2.patch

sed -i 's|-lf77blas -lcblas -latlas|-lblas|' config/linux.mk
sed -i 's|-lg2c| |' config/linux.mk

# For linux
mkdir -p external/lib/linux/

ln -s /usr/lib64/libblas.so external/lib/linux/libblas.so
ln -s /usr/lib64/liblapack.so external/lib/linux/liblapack.so

# Configure and make
./configure
make OPT_FLAGS="$RPM_OPT_FLAGS -fPIC" LIBBLAS=-lblas LIBLAPACK=-llapack

