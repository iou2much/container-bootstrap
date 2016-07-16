#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  -e "VIRTUAL_HOST=spider.debug.life" \
  --name scrapy \
  --expose=8888 \
  -v /home/chibs/blog/restful_scrapy:/notebooks \
  registry.aliyuncs.com/chibs/scipyserver \
  /bootstrap/start-django.sh
