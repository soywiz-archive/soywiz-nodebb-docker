#!/bin/bash
BASENAME=$(dirname "$(readlink -f "$0")")
. $BASENAME/domain.sh
docker rm -f $DOMAIN
docker run -d --name $DOMAIN \
  -p 80:4567 \
  -l host=$DOMAIN \
  -v $BASENAME/app:/app \
  -v $BASENAME/mongodb:/var/lib/mongodb \
  --restart on-failure \
  soywiz/nodebb
