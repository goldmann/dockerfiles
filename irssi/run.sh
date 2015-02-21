#!/bin/sh

mkdir -p /home/$USER/docker/irssi

docker kill irssi
docker rm irssi
docker run -d --name irssi -it -m 50m -v /home/$USER/docker/irssi:/home/irssi/data irssi
