#!/bin/bash
NODE_NAME="node-kanboard"
docker-machine start $NODE_NAME
docker-machine regenerate-certs -f $NODE_NAME
