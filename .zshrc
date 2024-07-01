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

source $ZSH/oh-my-zsh.sh

# Aliases
alias ls="exa"
alias ll='exa -lbGF --git'
alias la='exa -lBha --git --color-scale'
alias c="clear"
alias cd="z"

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

# Run on shell start
fastfetch

