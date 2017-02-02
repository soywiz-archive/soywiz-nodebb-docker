#!/usr/bin/env bash

if [[ ! -d /app ]]; then
    echo "=> An empty or uninitialized /app volume is detected"
    echo "=> Installing MySQL ..."
    cp -rf /app-base /app
    echo "=> Done!"  
else
    echo "=> Using an existing volume /app"
fi

. /home/node/.nvm/nvm.sh && nvm use default; cd /app; node /app/app.js
