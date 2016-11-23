#!/usr/bin/env bash

echo "Installing Docker."

sudo apt-get update

sudo apt-get install -y \
  apt-transport-https \
  ca-certificates

sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C0

"deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list
