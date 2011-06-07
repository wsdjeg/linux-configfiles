alias ls="ls --color=auto"
alias ll="ls -lFgh"
alias l="ll -A"

c() {
  cd "$1";
  l;
}

PS1="\$ "

EDITOR="vim"
SVN_EDITOR=$EDITOR
GIT_EDITOR=$EDITOR

export PAGER=~/.bin/vimpager
alias less=$PAGER

PATH=~/.bin:$PATH
export PATH

export NODE_PATH='/usr/local/lib/node'

