ll() {
  ls -FgHl --color=auto "$@";
}

l() {
  ls -AFgHl --color=auto "$@";
}

c() {
  cd "$1";
  pwd;
  echo "";
  l;
  echo "";
  pwd;
}

g() {
  git "$@";
}

# vi mode for the commandline
set -o vi

PS1="\n\$ "

# copy/paste to X clipboard from commandline
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

export EDITOR="vim"
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export PAGER=~/.bin/vimpager
alias less=$PAGER

PATH=~/bin:$PATH
PATH=~/.bin:$PATH
export PATH

export NODE_PATH="/usr/local/bin/node"

#export LC_ALL=en_US.utf-8
#export LANG="$LC_ALL"
