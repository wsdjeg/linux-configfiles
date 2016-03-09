export ZSH=/home/tom/.oh-my-zsh

# TODO: pick a theme from ~/.oh-my-zsh/themes
#ZSH_THEME="bureau"
ZSH_THEME="agnoster"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
# TODO: pick plugins from ~/.oh-my-zsh/plugins
plugins=(git git-extras git_remote_branch git-flow github docker jsontools npm urltools)

source $ZSH/oh-my-zsh.sh

# Variables
EDITOR="vim";
GIT_EDITOR=$EDITOR;
MAKEFLAGS="-j 7";
PATH="/home/tom/.bin:$PATH";

# Remove things set by Oh My ZSH
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

# Set vi mode
bindkey -v

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
