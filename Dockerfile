FROM ubuntu as build

MAINTAINER Belly Buster "github@belly-buster.com"

ARG MONGODB_VERSION=${MONGODB_VERSION:-4.4}
ARG MONGODB_TOOLS_VERSION=${MONGODB_TOOLS_VERSION:-100.3.1}

ADD https://fastdl.mongodb.org/linux/mongodb-shell-linux-x86_64-ubuntu2004-4.4.5.tgz /tmp/
ADD https://fastdl.mongodb.org/tools/db/mongodb-database-tools-debian10-x86_64-100.3.1.deb /tmp/
RUN apt-get update && \
    apt-get install -y libcurl4 openssl liblzma5 /tmp/mongodb-database-tools-debian10-x86_64-100.3.1.deb && \
    tar -xzf /tmp/mongodb-shell-linux-x86_64-ubuntu2004-4.4.5.tgz -C /tmp && \
    mv /tmp/mongodb-linux-x86_64-ubuntu2004-4.4.5/bin/mongo /usr/bin/mongo
