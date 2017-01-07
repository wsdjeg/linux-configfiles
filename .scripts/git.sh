#!/usr/bin/env bash

echo "Installing git."

sudo apt-get install -y git

if [ -f ~/.gitconfig ]; then
  rm ~/.gitconfig
fi
ln -s $REPO/.gitconfig ~
