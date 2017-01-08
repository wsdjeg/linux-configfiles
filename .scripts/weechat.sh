#!/usr/bin/env bash

echo "Installing weechat."

sudo apt-get install -y weechat

if [ -d $HOME/.weechat ]; then
  rm $HOME/.weechat
fi
ln -s $REPO/.weechat ~
