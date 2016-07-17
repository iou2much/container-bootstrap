#!/bin/sh
hostname=`hostname`
#hostname='zk1.svc'
is_exist=0

`etcdctl2 ls /zk/hosts/${hostname} > /dev/null 2>&1 ` && is_exist=1

if [ $is_exist -eq 1 ] ;
then
  echo 'hostname already exists!!!!!!!!'
  confd -confdir=/bootstrap/zookeeper/confd/ -watch=true -onetime=false -backend etcd -node http://etcd.svc:2379 &
  /bootstrap/zookeeper/reload.sh
  #/usr/local/zookeeper/bin/zkServer.sh start-foreground
else

  count=`etcdctl2 ls /zk/hosts 2> /dev/null | wc -l`
  id=$(($count+1))

  echo $count

  rm -rf /tmp/zookeeper/ 2> /dev/null
  mkdir -p /tmp/zookeeper/logs /tmp/zookeeper/zkdata
  echo "${id}" > /tmp/zookeeper/zkdata/myid

  confd -confdir=/bootstrap/zookeeper/confd/ -watch=true -onetime=false -backend etcd -node http://etcd.svc:2379 &
  sleep 5

  etcdctl2 set /zk/hosts/${hostname} '{"id":"'${id}'","hostname":"'${hostname}'"}'
  etcdctl2 set /trackdown/${hostname} "/zk/hosts/${hostname}"

fi


while true
do
    sleep 86400
done
