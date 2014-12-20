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

# TODO: Find a way for this to work with bash-completion-git
#g() {
#  git "$@";
#}

g() {
  DEBUGGING=1 gulp;
}

# vi mode for the commandline
set -o vi

PS1="\n\D{%Y-%M-%d %H:%M:%S} \w\nλ "
#PS1="\n\u@\h \w\n\D{%Y-%M-%d %H:%M:%S} ⚡ "

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
PATH=~/npm/bin:$PATH
export PATH

export NODE_PATH="/usr/bin/node"
alias npm='npm --python=python2'
#alias npi='npm --python=python2'

alias gitk='gitk --all'

# Source files in ~/.sh
source ~/.sh/bash-completion-git.sh
source ~/.sh/bash-completion-gitflow.sh

# Fleet (Docker)
export FLEETCTL_TUNNEL=127.0.0.1:2222
#ssh-add ~/.vagrant.d/insecure_private_key
