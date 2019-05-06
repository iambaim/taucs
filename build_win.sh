#!/bin/sh

# Build METIS
curl -o metis.tgz http://glaros.dtc.umn.edu/gkhome/fetch/sw/metis/OLD/metis-4.0.3.tar.gz
tar -zxvf metis.tgz
cd metis-4.0.3
make
export LMETIS_LOC=-L`pwd`
cd ..

# Start build

make -f configurator/makefile.unix

export OSTYPE=linux

configurator/configurator

make LDFLAGS="-fPIC -D__USE_MINGW_ANSI_STDIO=1 $LMETIS_LOC" OPT_FLAGS="-fPIC -D__USE_MINGW_ANSI_STDIO=1"
