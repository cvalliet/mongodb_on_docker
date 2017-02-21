#!/bin/sh

P1=$1
P2=$2
P3=$3

MONGODB_NAME=${P1:-test}
MONGODB_PATH=${P2:-/opt/mongodb/$MONGODB_NAME}
MONGODB_PORT=${P3:-27017}
DOCKER_TAG=mongodb_$MONGODB_NAME

mkdir -p $MONGODB_PATH/data/db

echo docker build -t $DOCKER_TAG .
echo docker run -v $MONGODB_PATH/data/db:/data/db -p $MONGODB_PORT:27017 --rm $DOCKER_TAG
