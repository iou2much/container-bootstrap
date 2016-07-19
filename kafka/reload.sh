#!/bin/sh
while true
do
  if mkdir /tmp/kafka.lock 2>/dev/null; then

    break
  else
    echo 'waiting for lock..' >> /tmp.log
    sleep 1
  fi
done

#if [ -f /tmp/zookeeper/zkdata/zookeeper_server.pid ] ;
#then
#    kill -9 `cat /tmp/zookeeper/zkdata/zookeeper_server.pid` 2>/dev/null
#    kill -9 `jps|awk '{print $1}'` 2>/dev/null
#    echo 'killed zk process'>> /tmp.log
#fi

/usr/local/kafka/bin/kafka-server-stop.sh

port_occupy=`netstat -anp|grep 9092|wc -l`
while [ 'x'$port_occupy != 'x0' ]
do
  echo 'waiting for port available'>> /tmp.log
  port_occupy=`netstat -anp|grep 9092|wc -l`
  sleep 1
done

#/usr/local/zookeeper/bin/zkServer.sh restart

/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties

sleep 5
rmdir /tmp/kafka.lock
