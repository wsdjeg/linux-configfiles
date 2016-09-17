#!/usr/bin/env bash

echo "Installing steam."

#if [ -f ~/.npmrc ]; then
#  rm ~/.npmrc
#fi
#ln -s $REPO/.npmrc ~

sudo apt-get install -y steam > /dev/null
