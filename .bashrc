ll() {
  ls -FgHl --color=auto $1;
}

l() {
  ls -AFgHl --color=auto $1;
}

c() {
  cd "$1";
  l;
}

# vi mode for the commandline
set -o vi

PS1='\n$(date +"%F %X")\n|-- \u@\H:\w\n'\''-> '

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

