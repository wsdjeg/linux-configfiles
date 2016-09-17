#!/usr/bin/env bash

echo "Installing zsh."

sudo apt-get install -y zsh > /dev/null

export TERM=xterm
if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
if [ -d ~/.oh-my-zsh ]; then
  rm  -rf ~/.oh-my-zsh
fi
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh > /dev/null
if [ -f ~/.zshrc ]; then
  rm ~/.zshrc
fi
ln -s $REPO/.zshrc ~
