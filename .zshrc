# Oh my zsh
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load 
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    ZSH_THEME="oxide-ssh"
else
    ZSH_THEME="oxide"
fi

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
alias ls="exa"
alias ll='exa -lbGF --git'
alias la='exa -lBha --git --color-scale'
alias c="clear"
alias cd="z"
alias nv="nvim"
alias lg="lazygit"

# CLI tools
# Openvpn for lab
alias labvpn="sudo openvpn --config $HOME/Vpns/IRL_vpn.ovpn --auth-user-pass $HOME/Vpns/IRL_auth.txt"

# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# nvim path
export PATH="$PATH:/opt/nvim-linux64/bin"

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# fnm
FNM_PATH="/home/seanlin/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/seanlin/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# spicetify
export PATH=$PATH:/home/seanlin/.spicetify

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/seanlin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/seanlin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/seanlin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/seanlin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Run on shell start
fastfetch
