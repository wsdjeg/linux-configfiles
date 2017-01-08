#!/usr/bin/env bash

echo "Installing X configuration."

if [ -f $HOME/.Xmodmap ]; then
  rm $HOME/.Xmodmap
fi
ln -s $REPO/.Xmodmap ~

if [ -f $HOME/.xinitrc ]; then
  rm $HOME/.xinitrc
fi
ln -s $REPO/.xinitrc ~
