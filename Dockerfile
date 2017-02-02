FROM ubuntu

MAINTAINER soywiz <soywiz@gmail.com>

EXPOSE 4567

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y nodejs npm
RUN apt-get install -y mongodb
RUN apt-get install -y redis-server

RUN mkdir /app
RUN git clone -b v1.4.3 https://github.com/NodeBB/NodeBB.git /app
RUN cd /app; git checkout v1.4.3
RUN cd /app; npm install

VOLUME ["/var/lib/mongodb/", "/app/public/uploads"]

# Start MongoDB
ENTRYPOINT mongod --fork -f /etc/mongodb.conf \
 && redis-server /etc/redis/redis.conf \
 && nodejs /app/app.js \
 && bash