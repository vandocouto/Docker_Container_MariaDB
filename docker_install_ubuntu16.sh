#!/bin/bash

# instalando o Docker Engine no Ubuntu16
apt-get update
apt-get install apt-transport-https ca-certificates curl nfs-common -y

apt-key adv \
--keyserver hkp://ha.pool.sks-keyservers.net:80 \
--recv-keys 58118E89F3A912897C070ADBF76221572C52609D

echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list

apt-get update
apt-cache policy docker-engine
apt-get install docker-engine -y

# instalando o Rex-Ray no Ubuntu16
curl -sSL https://dl.bintray.com/emccode/rexray/install | sh -s -- stable

