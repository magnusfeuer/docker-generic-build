#!/usr/bin/env bash
# maintainer: Magnus Feuer

if [ "$#" -ne "1" ]
then
    echo "Usage: $0 <docker-file.dockerfile>"
    exit 1
fi

time docker image build                 \
    --build-arg USERNAME=${USER}        \
    --file ${1} \
    --tag $(basename ${1} .dockerfile):v1 .

docker image ls
