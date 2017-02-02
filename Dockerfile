FROM ubuntu:16.04

MAINTAINER soywiz <soywiz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y git supervisor mongodb bcrypt nodejs npm

RUN mkdir /app
RUN git clone -b v1.4.3 https://github.com/NodeBB/NodeBB.git /app
RUN cd /app; git checkout v1.4.3
RUN cd /app; npm install; npm install bcrypt -g

VOLUME ["/var/lib/mongodb/", "/app/public/uploads"]

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Start MongoDB
EXPOSE 4567
CMD ["/usr/bin/supervisord"]