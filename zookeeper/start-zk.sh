#!/bin/sh
hostname=`hostname`

`etcdctl2 ls /zk/hosts/${hostname} > /dev/null 2>&1 `  || 
confd -confdir=/bootstrap/zookeeper/confd/ -watch=true -onetime=false -backend etcd -node http://etcd.svc:2379 & \
&& /usr/local/zookeeper/bin/zkServer.sh start-foreground \
&& \
exit 'exists hostname'

count=`etcdctl2 ls /zk/hosts 2> /dev/null | wc -l`
id=$(($count+1))

etcdctl2 set /zk/hosts/${hostname} '{"id":"'${id}'","hostname":"'${hostname}'"}'



confd -confdir=/bootstrap/zookeeper/confd/ -watch=true -onetime=false -backend etcd -node http://etcd.svc:2379 &
rm -rf /tmp/zookeeper/ 2> /dev/null
mkdir -p /tmp/zookeeper/logs /tmp/zookeeper/zkdata
echo "${id}" > /tmp/zookeeper/zkdata/myid

etcdctl2 set /trackdown/${hostname} "/zk/hosts/${hostname}"

/usr/local/zookeeper/bin/zkServer.sh start-foreground
