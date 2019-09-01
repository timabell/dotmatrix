#!/bin/sh -v
# setup on Ubuntu 16.04 LTS, hosted on bytemark vps
# https://docs.docker.com/compose/install/#install-compose-on-linux-systems
# needs root

apt install docker.io curl

echo "Adding current user to 'docker' group, log out and in again for this to take effect. You'll then be able to run docker commands without sudo."
adduser $USER docker

dockerComposeVersion=1.24.1
# https://stackoverflow.com/a/42273713/10245
apt-get purge docker-compose
curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

docker --version
docker-compose --version
