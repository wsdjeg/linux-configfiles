#!/usr/bin/env bash

echo "Installing X configuration."

if [ -f $HOME/.Xmodmap ]; then
  rm $HOME/.Xmodmap
fi
ln -s $REPO/.Xmodmap ~
