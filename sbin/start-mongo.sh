#!/bin/sh
docker run -d \
--name=mongodb \
--net=foobar \
-v /data2/data_volume/mongodb_data:/data/db \
mongo
