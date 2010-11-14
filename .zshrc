# commonly used commands
alias ls='ls --color=auto'
alias ll='ls -lFGh'
alias l='ll -A'

# use vim keybinds
bindkey -v

# fix some keys
bindkey '^[[2~' overwrite-mode       # insert
bindkey '^[[3~' delete-char          # delete
bindkey '^[OH'  beginning-of-line    # home
bindkey '^[OF'  end-of-line          # end
bindkey '^[[A'  up-line-or-history   # up
bindkey '^[[B'  down-line-or-history # down
bindkey '^[[C'  forward-char         # right
bindkey '^[[D'  backward-char        # left

# shell prompt
PROMPT='
%m:%n %~
%# '

# set variables and export them
EDITOR='vim'

SVN_EDITOR=EDITOR

PATH=/home/tom/.bin:$PATH

export EDITOR
export SVN_EDITOR
export PATH

