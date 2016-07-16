#!/bin/sh
# --net=foobar \
docker run -d \
--name nginx-proxy \
-p 80:80 \
-p 443:443 \
-v /var/run/docker.sock:/tmp/docker.sock:ro \
-v /home/chibs/blog/conf:/etc/nginx \
-v /home/chibs/blog/logs/nginx:/var/logs/nginx \
-v /home/chibs/blog/conf/ssl/:/etc/nginx/certs \
jwilder/nginx-proxy
#docker run -d -p 80:80 -v /home/chibs/blog/conf/conf.d:/etc/nginx/conf.d -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
