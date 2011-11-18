ll() {
  ls -FgHl;
}

l() {
  ls -AFgHl;
}

c() {
  cd "$1";
  l;
}

# vi mode for the commandline
set -o vi

PS1="\n\h:\u \w\n\$ "

export EDITOR="vim"
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export PAGER=~/.bin/vimpager
alias less=$PAGER

PATH=~/.bin:$PATH
export PATH

export NODE_PATH="/usr/local/bin/node"

