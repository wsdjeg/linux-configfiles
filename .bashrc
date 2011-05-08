alias ls='ls --color=auto'
alias ll='ls -lFGh'
alias l='ll -A'

PS1='\n\h:\u \w\n\$ '

export EDITOR='vim'
export SVN_EDITOR=$EDITOR
export GIT_EDITOR=$EDITOR

export PAGER=~/.bin/vimpager
alias less=$PAGER

PATH=~/.bin:$PATH
PATH=~/.rvm/bin:$PATH
PATH=~/.rvm/gems/ruby-1.9.2-p0/bin:$PATH
PATH=~/Applications/nginx-0.8.53/sbin:$PATH
export PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

