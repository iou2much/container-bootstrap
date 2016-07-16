#!/bin/sh
docker start nginx-proxy big_poitras 
docker network connect foobar nginx-proxy 
docker start etcd.svc blog gateone 1.zookeeper.svc guest 2.zookeeper.svc blog-backend ibake IPythonApp2 redis-svc hdp-node0 
