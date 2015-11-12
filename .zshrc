export ZSH=/home/tom/.oh-my-zsh

# TODO: pick a theme from ~/.oh-my-zsh/themes
#ZSH_THEME="bureau"
ZSH_THEME="bureau"
HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"
# TODO: pick plugins from ~/.oh-my-zsh/plugins
plugins=(git git-extras git_remote_branch git-flow github docker jsontools npm redis-cli urltools vagrant)

PATH="/home/tom/npm/bin:$PATH"
PATH="/home/tom/.bin:$PATH"
export PATH

source $ZSH/oh-my-zsh.sh
