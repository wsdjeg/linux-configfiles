#!/usr/bin/env bash

# Shell improvments and misc commands.
ln -s ~/Repositories/linux-configfiles/.bin ~
ln -s ~/Repositories/linux-configfiles/.sh ~
ln -s ~/Repositories/linux-configfiles/.shell_prompt.sh ~

# Neovim
mkdir -p ~/.config
ln -s ~/Repositories/linux-configfiles/.config/nvim ~/.config/nvim

# ZSH
# TODO: Install oh my zsh.
# TODO: Get ZSH to be the default shell.
TERM=xterm
#RUN sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
rm ~/.zshrc
ln -s ~/Repositories/linux-configfiles/.zshrc ~

# Tmux.
ln -s ~/Repositories/linux-configfiles/.tmux.conf ~
ln -s ~/Repositories/linux-configfiles/.tmux ~

# Xmonad
# TODO: Do something with the .Xmodmap file.
# TODO: Do something with the .xinitrc file.
ln -s ~/Repositories/linux-configfiles/.xmonad ~

# Ack-Grep
ln -s ~/Repositories/linux-configfiles/.ackrc ~

# Bash
#ln -s ~/Repositories/linux-configfiles/.bashrc ~

# Git
ln -s ~/Repositories/linux-configfiles/.gitconfig ~

# Node.js
# TODO: Install NPM and Node.js
# TODO: Do it via a version manager like n or nvm. Prefer n over nvm.
ln -s ~/Repositories/linux-configfiles/.npmrc ~
