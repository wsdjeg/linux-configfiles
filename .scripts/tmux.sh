#!/usr/bin/env bash

echo "Installing tmux."

sudo apt-get install -y tmux

if [ -d ~/.tmux ]; then
  rm ~/.tmux
fi
if [ -f ~/.tmux.conf ]; then
  rm ~/.tmux.conf
fi
ln -s $REPO/.tmux.conf ~
ln -s $REPO/.tmux ~
