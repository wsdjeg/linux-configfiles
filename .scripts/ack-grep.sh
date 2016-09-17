#!/usr/bin/env bash

echo "Installing ack-grep."

sudo apt-get install -y ack-grep > /dev/null

if [ -f ~/.ackrc ]; then
  rm ~/.ackrc
fi
ln -s $REPO/.ackrc ~
