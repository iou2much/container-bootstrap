#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  --hostname $1 \
  --name $1 \
  --expose=9092 \
  registry.aliyuncs.com/chibs/scipyserver \
  /start-kafka.sh $2
