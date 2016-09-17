#!/usr/bin/env bash

echo "Installing weechat."

sudo apt-get install -y weechat > /dev/null

if [ -d ~/.weechat ]; then
  rm ~/.weechat
fi
ln -s $REPO/.weechat ~
