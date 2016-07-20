#!/bin/sh
docker run \
  --volume=/:/rootfs:ro \
  --volume=/var/run:/var/run:rw \
  --volume=/sys:/sys:ro \
  --volume=/var/lib/docker/:/var/lib/docker:ro \
  --expose=8080 \
  --detach=true \
  --name=cadvisor \
  -e "VIRTUAL_HOST=monitor.debug.life" \
  --net=foobar \
  google/cadvisor:latest

