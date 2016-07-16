#!/usr/bin/env bash

#  -p 80:80 \
#  -p 443:443 \
#exec docker run -d \
# --link gateone:gateone \
# -e "VIRTUAL_PROTO=https" \
# -p 10444:443 \
exec docker run -d \
  -v "/home/chibs/blog/conf-blog":/opt/openresty/nginx/conf \
  -v "/home/chibs/www/ibake.today":/home/chibs/debug.life \
  -v "/home/chibs/blog/logs":/var/log/nginx/ \
  -e "VIRTUAL_HOST=ibake.today,www.ibake.today" \
  --expose=80 \
  --net=foobar \
  --name ibake \
  ficusio/openresty "$@"
#  ficusio/openresty cat /etc/hosts
#  -p 8888:8888
sleep 5
service iptables restart
#  ficusio/openresty nginx -g "daemon on; error_log logs/error_log info;"
#  ficusio/openresty ls -lR /opt/openresty/nginx/

# you may add more -v options to mount another directories, e.g. nginx/html/

# do not do -v "$(pwd)/nginx":/opt/openresty/nginx because it will hide
# the NginX binary located at /opt/openresty/nginx/sbin/nginx

