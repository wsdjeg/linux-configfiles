#!/usr/bin/env bash

echo "Installing zsh."

sudo apt-get install -y zsh

export TERM=xterm
if [ -f $HOME/.zshrc ]; then
  rm $HOME/.zshrc
fi
if [ -d $HOME/.oh-my-zsh ]; then
  rm  -rf $HOME/.oh-my-zsh
fi
git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
if [ -f $HOME/.zshrc ]; then
  rm $HOME/.zshrc
fi
ln -s $REPO/.zshrc ~
