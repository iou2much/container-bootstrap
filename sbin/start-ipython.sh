#!/usr/bin/env bash

exec docker run -d \
  --net=foobar \
  -e "PASSWORD=123456" \
  -e "VIRTUAL_HOST=notebook.debug.life" \
  --name IPythonApp2 \
  --expose=8888 \
  -e "USE_HTTP=1" \
  -v /home/chibs/ipython-data:/notebooks/data:ro \
  -v /home/chibs/ipython-root:/notebooks \
  -v /data2/nltk_data:/root/nltk_data:ro \
  -v /home/chibs/blog/backend:/root/backend:ro \
  -v /var/run/docker.sock:/tmp/docker.sock:ro \
  registry.aliyuncs.com/chibs/scipyserver \
  /bootstrap/start-notebook.sh
