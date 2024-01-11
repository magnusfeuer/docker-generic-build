#!/usr/bin/env bash
#
# Maintainer: Magnus Feuer
#
# Thanks to Ravi Chandran:
# https://opensource.com/article/20/4/how-containerize-build-system

cd /src

# Use provided arguments as the command to
# execute in the container.
$*
