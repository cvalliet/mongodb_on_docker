from ubuntu:16.04

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
# RUN groupadd -r mongodb && useradd -r -g mongodb mongodb

RUN \
   apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
   echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
   apt-get update && \
   apt-get install -y mongodb-org

VOLUME ["/data/db"]
WORKDIR /data

EXPOSE 27017

CMD ["mongod"] 