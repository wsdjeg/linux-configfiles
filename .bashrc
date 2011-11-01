#alias ls="ls --color=auto"
export CLICOLOR=true
alias ll="ls -lFgh"
alias l="ll -A"

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

