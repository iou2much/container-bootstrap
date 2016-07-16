#!/bin/sh
docker run -d \
--net=foobar \
--name etcd.svc \
--hostname=etcd.svc \
-p 2379:2379 \
-p 2380:2380 \
etcd \
--name etcd \
--listen-client-urls http://0.0.0.0:2379 \
--advertise-client-urls http://etcd.svc:2379 \
--listen-peer-urls http://0.0.0.0:2380 

#--initial-advertise-peer-urls http://0.0.0.0:2380 \
#--initial-cluster-token etcd-cluster-1 \
#--initial-cluster etcd=http://0.0.0.0:2380 \
#--initial-cluster-state new

