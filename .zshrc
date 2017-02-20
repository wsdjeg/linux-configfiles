export ZSH=$HOME/.oh-my-zsh

# TODO: pick a theme from $HOME/.oh-my-zsh/themes
ZSH_THEME="bureau"
#ZSH_THEME="agnoster"
#ZSH_THEME="sunrise"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
# TODO: pick plugins from $HOME/.oh-my-zsh/plugins
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

# TODO: Document.
unsetopt share_history;

# Spelling correction>
setopt CORRECT;

# Set vi mode.
bindkey -v

# TODO: Find a way to go both up and down in history search.
# History search on up/down
bindkey '^R' history-beginning-search-backward
# These don't work somehow
#bindkey '^[[A' history-beginning-search-backward
#bindkey '^[[B' history-beginning-search-forward

# TODO: Find a way to declare this in a separate file.
# This one is an alias because putting it in it's own executable won't work
# (different shell instance?).
c() {
  cd "$1";
  l .;
}

# Common environment variables.
EDITOR=nvim
GIT_EDITOR=nvim

# Command line execution path.
PATH=$HOME/.bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
PATH=$HOME/npm/bin:$PATH
PATH=$HOME/Applications/RoboMongo/bin:$PATH

# Go
GOPATH=$HOME/go
PATH=$GOROOT/bin:$PATH
PATH=$GOPATH/bin:$PATH

# Node Version Manager
NVM_DIR=$HOME/.nvm
. $NVM_DIR/nvm.sh

# Export the environment variables.
export EDITOR
export GIT_EDITOR
export GOPATH
export NVM_DIR
export PATH
