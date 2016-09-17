#!/usr/bin/env bash

echo "Installing neovim."

sudo apt-get install -y \
  software-properties-common \
  xclip \
  xsel \
  python-dev \
  python-pip \
  python3-dev \
  python3-pip \
  > /dev/null

sudo add-apt-repository -y ppa:neovim-ppa/unstable > /dev/null
sudo apt-get update > /dev/null
sudo apt-get install -y neovim > /dev/null


mkdir -p ~/.config
if [ -d ~/.config/nvim ]; then
  rm ~/.config/nvim
fi
ln -s $REPO/.config/nvim ~/.config/nvim
mkdir -p ~/.config/nvim/backup
mkdir -p ~/.config/nvim/temp
