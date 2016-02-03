export ZSH=/home/tom/.oh-my-zsh

# TODO: pick a theme from ~/.oh-my-zsh/themes
#ZSH_THEME="bureau"
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
# TODO: pick plugins from ~/.oh-my-zsh/plugins
plugins=(git git-extras git_remote_branch git-flow github docker jsontools npm redis-cli urltools vagrant)

source $ZSH/oh-my-zsh.sh

# Variables
EDITOR="vim";
GIT_EDITOR=$EDITOR;
MAKEFLAGS="-j 7";
PATH="~/.bin:$PATH";

# Remove things set by Oh My ZSH
unalias l;
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

# Alias functions
ll() {
  ls -FhHlX --color=auto --group-directories-first "$@";
}

l() {
  ls -AFhHlX --color=auto --group-directories-first "$@";
}

c() {
  cd "$1";
  l .;
}

r() {
  rm -rf "$1";
}

n() {
  npm "$@";
}

# Exports
export PATH;
export EDITOR;
export GIT_EDITOR;
export MAKEFLAGS;
