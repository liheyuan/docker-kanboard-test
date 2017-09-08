#!/bin/bash
NODE_NAME="node-kanboard"
DOCKER_NAME="sbmvt-kanboard"
VOLUME_DATA='/var/lib/boot2docker/docker_data/kanboard/data'
VOLUME_PLUGIN='/var/lib/boot2docker/docker_data/kanboard/plugin'
eval $(docker-machine env $NODE_NAME)
last_id=$(docker ps -l -q)
docker rm -f $last_id
docker run --volume "$VOLUME_DATA":/var/lib/ldap --volume "$VOLUME_DATA":/var/www/app/data --volume "$VOLUME_PLUGIN":/var/www/app/plugins -p80:80 --detach kanboard/kanboard:v1.0.46
