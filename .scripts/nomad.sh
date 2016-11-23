#!/usr/bin/env bash

echo "Installing Nomad."

if [ -f ~/.bin/nomad ]; then
  rm ~/.bin/nomad
fi

cd $REPO/.bin

wget https://releases.hashicorp.com/nomad/0.4.1/nomad_0.4.1_linux_amd64.zip

unzip nomad_0.4.1_linux_amd64.zip

rm nomad_0.4.1_linux_amd64.zip
