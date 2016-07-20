
docker run -d \
--name guest \
--net=guest \
-m 100m --memory-swap=100m \
--cpu-shares=50 \
--memory-swappiness=90 \
guest \
/startup.sh

#--storage-opt dm.basesize=1M
##!/bin/sh
#while true
#do
#ls /
#done
