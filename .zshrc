# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load 
ZSH_THEME="oxide"

plugins=(
	git
	zsh-autosuggestions
    zsh-vi-mode
)

# For zsh vi mode 
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
ZVM_INIT_MODE=sourcing

source $ZSH/oh-my-zsh.sh

# Aliases
alias ll='ls -l'
alias la='ls -A'
alias c="clear"
alias cd="z"
alias nv="nvim"
alias lg="lazygit"

# CLI tools

# fnm
eval "$(fnm env --use-on-cd)"

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Run on shell start
fastfetch
