#!/bin/sh

mkdir -p /var/docker/mongodb_test/data/db
docker build -t mongodb_test . && docker run -v /var/docker/mongodb_test/data/db:/data/db -p 27017:27017 --rm mongodb_test
