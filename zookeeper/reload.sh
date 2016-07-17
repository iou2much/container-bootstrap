#!/bin/sh
while true
do
  if mkdir /tmp/zk.lock 2>/dev/null; then

#  if [ -f /tmp/zk.lock ] ;
    break
  else
    echo 'waiting for lock..' >> /tmp.log
    sleep 1
  fi
done
#touch /tmp/zk.lock

cat /usr/local/zookeeper/conf/zoo.cfg |sed "s/`hostname`/0.0.0.0/g" > /usr/local/zookeeper/conf/zoo.cfg

if [ -f /tmp/zookeeper/zkdata/zookeeper_server.pid ] ;
then
    kill -9 `cat /tmp/zookeeper/zkdata/zookeeper_server.pid` 2>/dev/null
    kill -9 `jps|awk '{print $1}'` 2>/dev/null
    echo 'killed zk process'>> /tmp.log
fi

port_occupy=`netstat -anp|grep 2181|wc -l`
while [ $port_occupy -neq 0 ]
do
  echo 'waiting for port available'>> /tmp.log
  port_occupy=`netstat -anp|grep 2181|wc -l`
  sleep 1
done

rm /tmp/zookeeper/zkdata/version-2/*
/usr/local/zookeeper/bin/zkServer.sh restart

sleep 5
rmdir /tmp/zk.lock
