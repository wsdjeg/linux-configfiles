alias ls='ls --color=auto'
alias ll='ls -lFGh'
alias l='ll -A'

PS1='\n\h:\u \w\n\$ '

EDITOR='vim'
SVN_EDITOR=$EDITOR
GIT_EDITOR=$EDITOR

export PAGER=~/.bin/vimpager
alias less=$PAGER

PATH=~/.bin:$PATH
export PATH

export NODE_PATH='/usr/local/lib/node'

