#!/bin/sh
cat /usr/local/zookeeper/conf/zoo.cfg |sed "s/`hostname`/0.0.0.0/g" > /usr/local/zookeeper/conf/zoo.cfg
if [ -f /tmp/zookeeper/zkdata/zookeeper_server.pid ] ; 
then
    kill -9 `cat /tmp/zookeeper/zkdata/zookeeper_server.pid`
fi
/usr/local/zookeeper/bin/zkServer.sh restart
