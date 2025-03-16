# Set PATH vars
path+=/home/rice/Devspace/bin
path+=/home/rice/Devspace/dev/ShellScripts/run
path+=/home/rice/'jdk-23.0.2'/bin
path+=/home/rice/go

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

# Load zsh completion
autoload -U compinit && compinit

# Load aliases
. ~/.zsh_aliases

# Load custom functions
. ~/.zsh_functions

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

## SHOWOFF!!
fastfetch
