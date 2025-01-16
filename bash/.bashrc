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
set -o ignoreeof #Disable the ctrl-d (Avoid exit on accident), use 'exit' command instead

test -s ~/.alias && . ~/.alias || true
[ "$SIMPLE_SHELL" = "false" ] || eval "$(starship init bash)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"

export EDITOR=nvim  #Neovim as default editor

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

source ~/.bash_func #Utils functions using bashscript

. "$HOME/.cargo/env"

