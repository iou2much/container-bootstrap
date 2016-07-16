#!/bin/sh
docker run -t \
-d -e "VIRTUAL_HOST=linux.debug.life" \
-e "VIRTUAL_PROTO=https" \
--name=gateone \
--net=foobar \
--expose=8000 \
liftoff/gateone
