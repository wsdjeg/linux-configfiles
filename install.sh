#!/usr/bin/env bash

# Shell improvments and misc commands.
  ln -s ~/Repositories/linux-configfiles/.bin ~
  ln -s ~/Repositories/linux-configfiles/.sh ~

# Bash
  #ln -s ~/Repositories/linux-configfiles/.bashrc ~

# ZSH
# NOTE: This one should go last, as it drops the user into a zsh
#       session. Any commands follwing these will be ignored.
# TODO: Install oh my zsh.
# TODO: Get ZSH to be the default shell.
  export TERM=xterm
  if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
  fi
  if [ -d ~/.oh-my-zsh ]; then
    rm  -rf ~/.oh-my-zsh
  fi
  git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
  if [ -f ~/.zshrc ]; then
    rm ~/.zshrc
  fi
  ln -s ~/Repositories/linux-configfiles/.zshrc ~

# Neovim
  mkdir -p ~/.config
  ln -s ~/Repositories/linux-configfiles/.config/nvim ~/.config/nvim

# Tmux.
  ln -s ~/Repositories/linux-configfiles/.tmux.conf ~
  ln -s ~/Repositories/linux-configfiles/.tmux ~

# Xmonad
# TODO: Do something with the .Xmodmap file.
# TODO: Do something with the .xinitrc file.
  ln -s ~/Repositories/linux-configfiles/.xmonad ~

# Ack-Grep
  ln -s ~/Repositories/linux-configfiles/.ackrc ~

# Git
  ln -s ~/Repositories/linux-configfiles/.gitconfig ~

# Node.js
# TODO: Install NPM and Node.js
# TODO: Do it via a version manager like n or nvm. Prefer n over nvm.
  ln -s ~/Repositories/linux-configfiles/.npmrc ~
