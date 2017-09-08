#!/bin/bash
NODE_NAME="node-kanboard"
VOLUME_DATA='/var/lib/boot2docker/docker_data/kanboard/data'
VOLUME_PLUGIN='/var/lib/boot2docker/docker_data/kanboard/plugin'
#docker-machine create -d virtualbox $NODE_NAME
## china mirror
docker-machine ssh $NODE_NAME "echo -e '{\n\"registry-mirrors\": [\t\"https://docker.mirrors.ustc.edu.cn\"]\n}' > ./daemon.json"
docker-machine ssh $NODE_NAME "sudo cp ./daemon.json /etc/docker/"
docker-machine restart $NODE_NAME
docker-machine regenerate-certs -f $NODE_NAME
# volume dir
docker-machine ssh $NODE_NAME "sudo mkdir -p $VOLUME_DATA"
docker-machine ssh $NODE_NAME "sudo chmod -R 777 $VOLUME_DATA"
# volume dir
docker-machine ssh $NODE_NAME "sudo mkdir -p $VOLUME_PLUGIN"
docker-machine ssh $NODE_NAME "sudo chown -R 777 $VOLUME_PLUGIN"
