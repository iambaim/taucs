#!/bin/bash

# Configure and make
./configure

make OPT_FLAGS="-fPIC" LDFLAGS="-fPIC"

