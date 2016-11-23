#!/usr/bin/env bash

echo "Installing Vagrant."

wget https://releases.hashicorp.com/vagrant/1.8.5/vagrant_1.8.5_x86_64.deb

sudo dpkg -i vagrant_1.8.5_x86_64.deb

rm vagrant_1.8.5_x86_64.deb
