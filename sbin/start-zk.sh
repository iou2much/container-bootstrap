#!/usr/bin/env bash

NODENAME=$1

exec docker run -d \
  --net=foobar \
  --name ${NODENAME} \
  --hostname=${NODENAME} \
  --expose=2181 \
  --expose=2888 \
  --expose=3888 \
  registry.aliyuncs.com/chibs/scipyserver \
  /bootstrap/zookeeper/start-zk.sh

