zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/Users/rcuser/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt autocd
setopt extendedglob
setopt nomatch
setopt notify

unsetopt appendhistory
unsetopt beep

# VIM keybinds
bindkey -v

