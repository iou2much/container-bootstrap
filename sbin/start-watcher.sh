#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  --name watcher \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  registry.aliyuncs.com/chibs/scipyserver \
  python /bootstrap/watcher/watch.py
