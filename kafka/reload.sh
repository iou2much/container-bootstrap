#!/bin/sh
while true
do
  if mkdir /tmp/kafka.lock 2>/dev/null; then

    break
  else
    echo 'waiting for lock..' #>> /tmp.log
    sleep 1
  fi
done

/usr/local/kafka/bin/kafka-server-stop.sh
kill -9 `jps|awk '{print $1}'` 2>/dev/null

rm -rf /tmp/kafka-logs

port_occupy=`netstat -anp|grep 9092|wc -l`
while [ 'x'$port_occupy != 'x0' ]
do
  echo 'waiting for port available' #>> /tmp.log
  port_occupy=`netstat -anp|grep 9092|wc -l`
  sleep 1
done

#/usr/local/zookeeper/bin/zkServer.sh restart

/usr/local/kafka/bin/kafka-server-start.sh -daemon /usr/local/kafka/config/server.properties
#/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties

sleep 5
rmdir /tmp/kafka.lock
