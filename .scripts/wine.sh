#!/usr/bin/env bash

echo "Installing wine."

sudo dpkg --add-architecture i386

sudo sudo add-apt-repository ppa:wine/wine-builds -y
sudo apt-get update

sudo apt-get install -y \
  ttf-mscorefonts-installer \
  winehq-devel

if [ -d $HOME/.wine ]; then
  rm $HOME/.wine
fi
ln -s /mnt/linux-data/.wine ~
