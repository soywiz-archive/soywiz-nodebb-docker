#!/bin/bash
BASENAME=$(dirname "$(readlink -f "$0")")
. $BASENAME/domain.sh
docker exec -it $DOMAIN /bin/bash
