#!/usr/bin/env bash
# maintainer: Magnus Feuer


time docker image build                 \
    --build-arg USERNAME=${USER}        \
    --file rmc_build.dockerfile \
    --tag reliable-multicast-build:v1 .

docker image ls
