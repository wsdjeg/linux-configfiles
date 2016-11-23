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
 

sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install -y neovim

sudo pip3 install --upgrade neovim
sudo pip3 install --upgrade neovim

mkdir -p ~/.config
if [ -d ~/.config/nvim ]; then
  rm ~/.config/nvim
fi
ln -s $REPO/.config/nvim ~/.config/nvim
mkdir -p ~/.config/nvim/backup
mkdir -p ~/.config/nvim/temp
