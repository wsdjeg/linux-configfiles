#!/usr/bin/env bash
export REPO=~/Repositories/linux-configfiles

if [ -d ~/.bin ]; then
  rm ~/.bin
fi
ln -s $REPO/.bin ~

if [ -d ~/.sh ]; then
  rm ~/.sh
fi
ln -s $REPO/.sh ~

# Dependencies
$REPO/.scripts/git.sh

# Terminal Setup
$REPO/.scripts/bash.sh
$REPO/.scripts/cmus.sh
$REPO/.scripts/tmux.sh
$REPO/.scripts/weechat.sh
$REPO/.scripts/zsh.sh

# Xorg
$REPO/.scripts/chromium.sh
$REPO/.scripts/xmonad.sh
$REPO/.scripts/xorg.sh

# Development
$REPO/.scripts/ack-grep.sh
$REPO/.scripts/android.sh
$REPO/.scripts/neovim.sh
$REPO/.scripts/nodejs.sh
$REPO/.scripts/nomad.sh
$REPO/.scripts/packer.sh
$REPO/.scripts/terraform.sh

#$REPO/.scripts/vagrant.sh
#$REPO/.scripts/virtualbox.sh

# Games
#$REPO/.scripts/autohotkey.sh
#$REPO/.scripts/playonlinux.sh
#$REPO/.scripts/steam.sh
#$REPO/.scripts/wine.sh
