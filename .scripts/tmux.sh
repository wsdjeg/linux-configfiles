#!/usr/bin/env bash

echo "Installing tmux."

sudo apt-get install -y tmux

if [ -d $HOME/.tmux ]; then
  rm $HOME/.tmux
fi
if [ -f $HOME/.tmux.conf ]; then
  rm $HOME/.tmux.conf
fi
ln -s $REPO/.tmux.conf ~
ln -s $REPO/.tmux ~
