export DOMAIN=localhost
BASENAME=$(dirname "$(readlink -f "$0")")
docker run -d --name $DOMAIN \
  -l host=$DOMAIN \
  -v $BASENAME/app:/app \
  -v $BASENAME/mongodb:/var/lib/mongodb \
  --restart on-failure \
  soywiz/nodebb
