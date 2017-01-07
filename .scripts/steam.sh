#!/usr/bin/env bash

echo "Installing steam."

sudo apt-get install -y steam

if [ -d ~/.steam ]; then
  rm -rf ~/.steam
fi
ln -s /mnt/linux-data/.steam ~
