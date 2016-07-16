#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  --name redis-svc \
  redis
  

