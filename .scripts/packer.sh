#!/usr/bin/env bash

echo "Installing Packer."

if [ -f $HOME/.bin/packer ]; then
  rm $HOME/.bin/packer
fi

cd $REPO/.bin

wget https://releases.hashicorp.com/packer/0.10.1/packer_0.10.1_linux_amd64.zip

unzip packer_0.10.1_linux_amd64.zip

rm packer_0.10.1_linux_amd64.zip
