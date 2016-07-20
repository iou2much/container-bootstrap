#!/bin/sh
docker start nginx-proxy big_poitras 
docker network connect foobar nginx-proxy 
docker start etcd.svc watcher blog mongodb gateone guest blog-backend ibake IPythonApp2 
#redis-svc 
#hdp-node0 
