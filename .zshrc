export ZSH=/home/tom/.oh-my-zsh

# TODO: pick a theme from ~/.oh-my-zsh/themes
ZSH_THEME="bureau"
#ZSH_THEME="agnoster"
#ZSH_THEME="sunrise"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
# TODO: pick plugins from ~/.oh-my-zsh/plugins
plugins=(
  battery
  colored-man-pages
  colorize
  command-not-found
  docker
  docker-compose
  git
  git-extras
  git-flow
  git-remote-branch
  github
  gitignore
  gulp
  history
  node
  npm
  nvm
  vi-mode
)

source $ZSH/oh-my-zsh.sh

# Variables
EDITOR="vim";
GIT_EDITOR=$EDITOR;
MAKEFLAGS="-j 7";

PATH="/home/tom/.bin:$PATH";
PATH="/home/tom/.cabal/bin:$PATH";
PATH="/home/tom/Applications/google-could-sdk/bin:$PATH";
PATH="/home/tom/n/bin:$PATH";
PATH="/home/tom/npm/bin:$PATH";
PATH="/home/tom/Applications/RoboMongo/bin:$PATH";

#TERM="xterm-256color"
#TERM="rxvt-unicode"

# Remove things set by Oh My ZSH
# TODO: Add location in file of where these are being set by oh my zsh.
unalias l;
unalias d;
unalias la;
unalias ll;
unalias ls;
unalias lsa;
unalias md;
unalias please;
unalias po;
unalias pu;
unalias rd;

unsetopt share_history;

# Spelling correction
setopt CORRECT;

# Set vi mode
bindkey -v

# History search on up/down
bindkey '^R' history-beginning-search-backward
# These don't work somehow
#bindkey '^[[A' history-beginning-search-backward
#bindkey '^[[B' history-beginning-search-forward


# This one is an alias because putting it in it's own executable won't work
# (different shell instance?).
c() {
  cd "$1";
  l .;
}

# Exports
export PATH;
export EDITOR;
export GIT_EDITOR;
export MAKEFLAGS;

# NVM
export NVM_DIR="/home/tom/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Run Tmux, but not if it's already in tmux.
# TODO: This approach doesn't work.
#if command -v tmux>/dev/null; then
#  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
#fi

~/.bin/xorg-keyboard
