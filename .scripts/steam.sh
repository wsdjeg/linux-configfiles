#!/usr/bin/env bash

echo "Installing steam."

sudo apt-get install -y steam

if [ -d $HOME/.steam ]; then
  rm -rf $HOME/.steam
fi
ln -s /mnt/linux-data/.steam ~
