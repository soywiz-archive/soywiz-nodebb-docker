#!/usr/bin/env bash

if [ ! -f /app/app.js ]; then
    echo "=> Can't find /app/app.js copying from /app-base"
    mkdir -p /app
    cp -rf /app-base/* /app
    echo "=> Done!"  
else
    echo "=> Using an existing volume /app"
fi

. /home/node/.nvm/nvm.sh && nvm use default; cd /app; node /app/app.js
