#!/usr/bin/env bash
# maintainer: Magnus Feuer

if [ "$#" -ne "2" ]
then
    echo "Usage: $0 <make target> <reliable multicast source dir>"
    exit 1
fi

docker container run                              \
    --volume $(pwd)/docker-build/scripts:/scripts    \
    --volume $2:/src                          \
    --user $(id -u ${USER}):$(id -g ${USER})      \
    --rm -it --name rmc_build reliable-multicast-build:v1  \
    build $1
