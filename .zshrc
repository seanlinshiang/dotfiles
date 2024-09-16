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
)

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
# Brew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# nvim path
export PATH="$PATH:/opt/nvim-linux64/bin"

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# fnm
FNM_PATH="/home/seanlinshiang/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/seanlinshiang/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# spicetify
export PATH=$PATH:/home/seanlinshiang/.spicetify

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/seanlinshiang/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/seanlinshiang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/seanlinshiang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/seanlinshiang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

export EDITOR=nvim

# Run on shell start
fastfetch
