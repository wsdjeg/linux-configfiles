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

# TODO: Find a way for this to work with bash-completion-git
#g() {
#  git "$@";
#}

# vi mode for the commandline
set -o vi

#PS1="\n\u@\h \w\n\D{%Y-%M-%d %H:%M:%S} λ "
PS1="\n\u@\h \w\n\D{%Y-%M-%d %H:%M:%S} ⚡ "

# copy/paste to X clipboard from commandline
alias pbcopy='xsel --clipboard --input'
alias pbpaste='xsel --clipboard --output'

export EDITOR="vim"
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

#export PAGER=~/.bin/vimpager
#alias less=$PAGER
#alias less=gvim

PATH=~/bin:$PATH
PATH=~/.bin:$PATH
PATH=~/.cabal/bin:$PATH
export PATH

export NODE_PATH="/usr/bin/node"
alias npm='npm --python=python2'
#alias npi='npm --python=python2'

#export LC_ALL=en_US.utf-8
#export LANG="$LC_ALL"

# Source files in ~/.sh
source ~/.sh/bash-completion-git.sh
source ~/.sh/bash-completion-gitflow.sh
