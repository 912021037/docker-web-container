#!/bin/bash

dinghy up
docker-compose up -d
sudo stone `docker ps -q | grep -v $(docker ps -q --filter='name=dinghy_http_proxy') | xargs -L 1 docker port | grep -o "[0-9]\+$" | tr '\n' ' ' | sed -e "s/\([0-9]\{1,\}\)/$(dinghy ip):\1 \1 --/g"`
