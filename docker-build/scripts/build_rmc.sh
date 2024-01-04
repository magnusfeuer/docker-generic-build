#!/usr/bin/env bash
# maintainer: Magnus Feuer
# Thanks to Ravi Chandran: https://opensource.com/article/20/4/how-containerize-build-system

cd /src

if [ $1 = "shell" ]; then    
    echo "Starting Bash Shell"
    /bin/bash
elif [ $1 = "build" ]; then
    echo "Building Reliable Multicast"
    make
    mkdir -p out
    DESTDIR=./out make install 
fi
