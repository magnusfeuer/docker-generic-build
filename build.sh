#!/usr/bin/env bash
# Maintainer: Magnus Feuer


# Did we not even get a docker image and a source code dir?
if [ "$#" -lt "2" ]
then
    echo "Usage: $0 <docker-image> <source-code-dir> [<build-command> [build-arguments]...]"
    echo "Default build command, if not specified, is an interactive bash shell."
    exit 1
fi

#
# Capture docker image name and source dir
# Shift out the arguments.
#
DOCKER_IMAGE=${1}
shift
SOURCE_DIR=$(realpath ${1})
shift

#
# Did we get a command (and possibly arguments)?
# If so capture it and shift out.
# If not, set command to /bin/bash
#
if [ "${#}" -gt "0" ]
then
    COMMAND=${1}
    shift
else
    COMMAND=/bin/bash
fi

#
# Run the docker container with any given commands
# and any arguments provided after the command.
#
docker container run \
    --volume $(realpath $(dirname ${0}))/docker-build/scripts:/scripts \
    --volume ${SOURCE_DIR}:/src \
    --user $(id -u ${USER}):$(id -g ${USER}) \
    --rm -it --name ${DOCKER_IMAGE} ${DOCKER_IMAGE}:v1 \
    ${COMMAND} $*
