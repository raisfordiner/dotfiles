typeset -U path
export PATH="$PATH:\
$HOME/devspace/bin:\
$HOME/jdk-23.0.2/bin:\
$HOME/go:\
$HOME/go/bin:\
$HOME/.cargo/bin:\
$HOME/.ghcup/bin:\
$HOME/.local/bin:\
$HOME/applications/bin"

## Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
## Set up zoxide for smart cd
eval "$(zoxide init bash)"

export MANPAGER=nvim
export EDITOR=nvim  #Neovim as default editor
#export EDITOR=nano  #Nano as default editor

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# if [ -f ~/.bash_functions ]; then
# . ~/.bash_functions
# fi

# Prompt
PS1='\u@\h:\w\$ '

# History config
HISTFILE=~/.bash_history
HISTSIZE=10000
HISTCONTROL=ignoreboth
shopt -s histappend

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

shopt -s dotglob
