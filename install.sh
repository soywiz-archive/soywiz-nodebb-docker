#!/bin/sh

#apt-get update -y && apt-get install -y curl

apt-get update -y && apt-get install -y curl

mkdir /home/node
chmod +x /root/nvm_install.sh
/bin/bash -c "/root/nvm_install.sh"
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

export NVM_DIR=/home/node/.nvm

. $NVM_DIR/nvm.sh
nvm install $NODE_VERSION
nvm alias default $NODE_VERSION
nvm use $NODE_VERSION
npm install -g bower pm2

apt-get update -y && apt-get install -y git supervisor mongodb bcrypt make gcc

mkdir /app
cd /app
git clone -b v1.4.3 https://github.com/NodeBB/NodeBB.git /app
git checkout v1.4.3

npm install
npm install bcrypt -g
