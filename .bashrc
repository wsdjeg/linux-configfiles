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

if [ $(id -u) -eq 0 ]; then
  PS1="\n\W \e[31m$\e[0m "
else
  PS1="\n\W \e[32m$\e[0m "
fi

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

