FROM debian:buster-slim

RUN apt-get update \
 && apt-get upgrade \    
 && apt-get install -y openssh-server \
 && service ssh start \
 && useradd --create-home --no-log-init --shell /bin/bash foo \
 && echo "foo:foo" | chpasswd

EXPOSE 22