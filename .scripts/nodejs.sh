#!/usr/bin/env bash

echo "Installing nodejs."

if [ -f ~/.npmrc ]; then
  rm ~/.npmrc
fi
ln -s $REPO/.npmrc ~

curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt-get install -y nodejs
