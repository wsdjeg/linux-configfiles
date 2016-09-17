#!/usr/bin/env bash

echo "Installing xmonad."

sudo apt-get install -y xmonad > /dev/null

if [ -d ~/.xmonad ]; then
  rm ~/.xmonad
fi
ln -s $REPO/.xmonad ~
