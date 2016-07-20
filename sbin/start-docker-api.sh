#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  --name docker-api \
  --expose=8888 \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  -v /home/chibs/ipython-root/docker_django/:/notebooks \
  registry.aliyuncs.com/chibs/scipyserver \
  /bootstrap/start-django.sh
