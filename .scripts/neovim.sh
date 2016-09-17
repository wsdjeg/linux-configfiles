#!/usr/bin/env bash

echo "NOT Installing neovim. TODO: Implement."

#sudo apt-get install -y git > /dev/null

mkdir -p ~/.config > /dev/null
if [ -d ~/.config/nvim ]; then
  rm ~/.config/nvim
fi
ln -s $REPO/.config/nvim ~/.config/nvim
