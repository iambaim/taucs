#!/bin/bash

# Build METIS
curl -o metis.tgz http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.3.tar.gz
tar -zxvf metis.tgz
cd metis-4.0.3
make
export LMETIS_LOC=-L`pwd`
cd ..

# Configure and make
./configure

make OPT_FLAGS="-fPIC" LDFLAGS="-fPIC $LMETIS_LOC"

