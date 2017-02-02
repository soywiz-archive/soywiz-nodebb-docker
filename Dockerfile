FROM ubuntu:16.04

MAINTAINER soywiz <soywiz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

#change it to your required node version
ENV NODE_VERSION 6.9.5

COPY install.sh /root/install.sh
COPY nvm_install.sh /root/nvm_install.sh
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ENV NVM_DIR /home/node/.nvm

RUN chmod 777 /root/install.sh && /bin/bash -c "source /root/install.sh"

VOLUME ["/var/lib/mongodb/", "/app/public/uploads"]

EXPOSE 4567
CMD ["/usr/bin/supervisord"]
