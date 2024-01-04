#!/usr/bin/env bash
# maintainer: Magnus Feuer

docker container run                              \
    --volume $(pwd)/docker-build/scripts:/scripts    \
    --volume $1:/src                          \
    --user $(id -u ${USER}):$(id -g ${USER})      \
    --rm -it --name rmc_shell reliable-multicast-build:v1  \
    shell
