#!/bin/sh

P1=$1
P2=$2

MONGODB_NAME=${P1:-test}
MONGODB_PORT=${P2:-27017}
MONGODB_PATH=/opt/mongodb/$MONGODB_NAME

DOCKER_TAG=mongodb_$MONGODB_NAME

mkdir -p $MONGODB_PATH/data/db

docker build -t $DOCKER_TAG . && \
docker run -v $MONGODB_PATH/data/db:/data/db -p $MONGODB_PORT:27017 --rm $DOCKER_TAG
