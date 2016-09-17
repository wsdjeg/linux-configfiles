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

$REPO/.scripts/git.sh
$REPO/.scripts/bash.sh
$REPO/.scripts/zsh.sh
$REPO/.scripts/cmus.sh
$REPO/.scripts/weechat.sh
$REPO/.scripts/tmux.sh
$REPO/.scripts/neovim.sh
$REPO/.scripts/xorg.sh
$REPO/.scripts/xmonad.sh
$REPO/.scripts/nodejs.sh
$REPO/.scripts/ack-grep.sh
