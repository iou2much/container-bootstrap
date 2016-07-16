#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  --hostname kafka-svc1 \
  --name kafka-svc1 \
  --expose=9092 \
  registry.aliyuncs.com/chibs/scipyserver \
  /start-kafka.sh 0 zookeeper:2181
