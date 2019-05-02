#!/bin/bash

curl -o taucs.tgz https://m.tau.ac.il/~stoledo/taucs/2.2/taucs.tgz

tar -zxvf taucs.tgz

patch -p1 < taucs-2.2.patch

sed -i'.original' -e 's|-lf77blas -lcblas -latlas|-lblas|' config/linux.mk
sed -i'.original' -e 's|-lg2c||' config/linux.mk

