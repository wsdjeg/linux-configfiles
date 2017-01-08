#!/usr/bin/env bash

echo "Installing git."

sudo apt-get install -y git

if [ -f $HOME/.gitconfig ]; then
  rm $HOME/.gitconfig
fi
ln -s $REPO/.gitconfig ~
