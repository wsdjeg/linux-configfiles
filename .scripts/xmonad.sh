#!/usr/bin/env bash

echo "Installing xmonad."

sudo apt-get install -y xmonad

if [ -d $HOME/.xmonad ]; then
  rm $HOME/.xmonad
fi
ln -s $REPO/.xmonad ~
