#!/usr/bin/env bash

echo "Installing ack-grep."

sudo apt-get install -y ack-grep

if [ -f $HOME/.ackrc ]; then
  rm $HOME/.ackrc
fi
ln -s $REPO/.ackrc ~
