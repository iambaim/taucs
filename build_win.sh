#!/bin/sh

cd ${APPVEYOR_BUILD_FOLDER}

# Start build

make -f configurator/makefile.unix

export OSTYPE=linux

configurator/configurator

make LDFLAGS="-fPIC -D__USE_MINGW_ANSI_STDIO=1" OPT_FLAGS="-fPIC -D__USE_MINGW_ANSI_STDIO=1"
