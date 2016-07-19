#!/bin/bash
hostname=`hostname`

if [ $# -lt 1 ]; then
   echo 'brokeID cannot be empty'
   exit 1
fi
eval $(cat /root/.bashrc | sed 's/^/export /')
#source /root/.bashrc

brokerID=$1


is_exist=0
`etcdctl2 ls /kafka/hosts/kafka.${brokerID}.svc > /dev/null 2>&1 ` && is_exist=1




if [ $is_exist -eq 1 & $hostname == "kafka.${brokerID}.svc" ] ;
then
  echo 'brokerId already exists!!!!!!!!'
  confd -confdir=/bootstrap/kafka/confd/ -watch=true -onetime=false -backend etcd -node http://etcd.svc:2379 &

  #/usr/local/kafka/bin/kafka-server-start.sh /usr/local/kafka/config/server.properties
  /bootstrap/kafka/reload.sh
else
  cat /bootstrap/kafka/confd/templates/server.properties.tmpl2 | sed "s/__BROKERID__/${brokerID}/g"  > /bootstrap/kafka/confd/templates/server.properties.tmpl

  confd -confdir=/bootstrap/kafka/confd/ -watch=true -onetime=false -backend etcd -node http://etcd.svc:2379 &
  sleep 5

  etcdctl2 set /kafka/hosts/${hostname} '{"id":"'${id}'","hostname":"'${hostname}'"}'
  etcdctl2 set /trackdown/${hostname} "/kafka/hosts/${hostname}"

fi


while true
do
    sleep 86400
done
