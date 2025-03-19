# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some shell setting

test -s ~/.alias && . ~/.alias || true

## Set up fzf key bindings and fuzzy completion
#eval "$(fzf --bash)"
## Set up zoxide for smart cd
#eval "$(zoxide init bash)"

#export EDITOR=nvim  #Neovim as default editor
export EDITOR=nano  #Nano as default editor

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

if [ -f ~/.bash_functions ]; then
. ~/.bash_functions
fi

# "sudo $HOME/.cargo/env"

# export $PATH
#export PATH="$PATH:~/Devspace/dev/ShellScripts/run"
#export PATH="$PATH:~/.local/bin"
#export PATH="$PATH:~/Devspace/bin"
