#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  --name hdp-node0 \
  --hostname=hdp-node0 \
  --expose=9000 \
  registry.aliyuncs.com/chibs/scipyserver \
  /bootstrap/hadoop/start-hdp.sh
