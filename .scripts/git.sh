#!/usr/bin/env bash

echo "Installing git."

sudo apt-get install -y git > /dev/null

if [ -f ~/.gitconfig ]; then
  rm ~/.gitconfig
fi
ln -s ~/Repositories/linux-configfiles/.gitconfig ~
