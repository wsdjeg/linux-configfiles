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

mkdir -p $HOME/.config
if [ -d $HOME/.config/nvim ]; then
  rm $HOME/.config/nvim
fi
ln -s $REPO/.config/nvim $HOME/.config/nvim
mkdir -p $HOME/.config/nvim/backup
mkdir -p $HOME/.config/nvim/temp
