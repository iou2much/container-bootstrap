#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  -e "VIRTUAL_HOST=api.debug.life" \
  --name blog-backend \
  --expose=8888 \
  -e "USE_HTTP=1" \
  -v /home/chibs/blog/backend:/notebooks \
  registry.aliyuncs.com/chibs/scipyserver \
  /start-django.sh
