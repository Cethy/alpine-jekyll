#!/bin/sh

# default action is build
ACTION=${1:-build}

if [ "$ACTION" == 'watch' ]
then
    jekyll build --watch --source $INPUT_DIR --destination $OUTPUT_DIR $INPUT_EXTRA_PARAMETERS
elif [ "$ACTION" == 'build' ]
then
    jekyll build --source $INPUT_DIR --destination $OUTPUT_DIR $INPUT_EXTRA_PARAMETERS
else
    jekyll $*
fi
