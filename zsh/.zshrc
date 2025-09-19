typeset -U path
# Set PATH vars
path+=$HOME/devspace/bin
path+=$HOME/'jdk-23.0.2'/bin
path+=$HOME/go
path+=$HOME/go/bin
path+=$HOME/.cargo/bin
path+=$HOME/.ghcup/bin
path+=$HOME/.local/bin
path+=$HOME/applications/bin

# Plugin manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
# zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
if [[ "$TERM" != "xterm-256color" ]]; then #Ignore neovim term buffers
    zinit snippet https://github.com/ohmyzsh/ohmyzsh/blob/master/plugins/sudo/sudo.plugin.zsh
fi
if [[ -z ~/.local/bin/on-my-posh ]]; then
    curl -s https://ohmyposh.dev/install.sh | bash -s
fi

# Load zsh completion
autoload -U compinit && compinit

# Load aliases
. ~/.zsh_aliases

# Load custom functions
. ~/.zsh_functions

export EDITOR=nvim

# Load Manpage with Neovim
export MANPAGER='nvim +Man!'

# Prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/base.toml)"

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
eval "$(fzf --zsh)"

# Zoxide
eval "$(zoxide init zsh)"

# Global opts
bindkey -e # Remove vi style binding
setopt globdots # Show hidden files

# History manager
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

#
# ## SHOWOFF!!
# function ff() {
#     if [[ "$TERM" = "xterm-kitty" ]]; then
#         fastfetch --kitty-direct ~/.config/fastfetch/void-logo.png --logo-width 45 --logo-height 15
#     # elif [ $TERM = foot ]; then
#     #     fastfetch --chafa ~/.config/fastfetch/void-logo.png --logo-width 50
#     else
#         fastfetch -c ~/.config/fastfetch/welcome.jsonc
#     fi
# }
#
# clear
# if [[ "$TERM" = "xterm-kitty" ]]; then
#     ff
# fi

