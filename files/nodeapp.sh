#!/usr/bin/env bash

if [ ! -f /app/app.js ]; then
    echo "=> Can't find /app/app.js copying from /app-base"
    mkdir -p /app
    cp -rf /app-base/* /app
    echo "=> Done!"  
else
    echo "=> Using an existing volume /app"
fi

echo "Waiting mongodb"
mongo --eval "print('READY');" | grep READY &> /dev/null
while [[ $? -ne 0 ]] ; do
    sleep 2
	echo "Waiting mongodb"
    mongo --eval "print('READY');" | grep READY &> /dev/null
done

. /home/node/.nvm/nvm.sh && nvm use default; cd /app; node /app/app.js --port 80
