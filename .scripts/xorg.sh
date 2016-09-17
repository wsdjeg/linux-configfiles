#!/usr/bin/env bash

echo "Installing X configuration."

if [ -f ~/.Xmodmap ]; then
  rm ~/.Xmodmap
fi
ln -s $REPO/.Xmodmap ~
