#!/bin/bash

set -e

trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "$0: \"${last_command}\" command failed with exit code $?"' ERR

# build the package
catkin build --this # it has to be fully built normally before building with --catkin-make-args tests
catkin build --this --no-deps --catkin-make-args tests

catkin test --this -i -p 1 -s
