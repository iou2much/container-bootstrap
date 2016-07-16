#!/bin/bash

if [ $# -lt 2 ]; then
   echo 'brokeID and zk parameter cannot be empty'
   exit 1
fi
eval $(cat /root/.bashrc | sed 's/^/export /')
#source /root/.bashrc

brokerID=$1
zk=$2
cat /usr/local/kafka/config/server.properties.template | sed "s/__BROKERID__/${brokerID}/g" | sed "s/__ZKCLUSTER__/${zk}/g" > /usr/local/kafka/config/server.properties
/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
