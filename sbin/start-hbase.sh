#!/bin/sh
#docker run -d --expose=[50020,9000,50090,2122,50070,37272,50010,50075,8030,8031,8032,8033,8040,8042,2122,39990,8088,13562] sequenceiq/hadoop-docker:2.7.1 /etc/bootstrap.sh 
docker run -h hbase-docker -t -d --name hbase --net=foobar hbase2 
