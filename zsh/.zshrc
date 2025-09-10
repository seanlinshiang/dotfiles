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

# zsh vi mode
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode

# Aliases
alias ls="eza"
alias ll='eza -lbGF --git'
alias la='eza -lBha --git --color-scale'
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
FNM_PATH="/home/sean/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/sean/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# spicetify
export PATH=$PATH:/home/sean/.spicetify

# Lazy-load conda: initialize only when conda is first used
_conda_lazy_init() {
    # Run original conda init setup
    __conda_setup="$('/home/sean/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    elif [ -f "/home/sean/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sean/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sean/miniconda3/bin:$PATH"
    fi
    unset __conda_setup

    # Unset the placeholder function so the real command runs next time
    unfunction conda
    conda "$@"
}

# Define conda as a placeholder function
function conda() {
    _conda_lazy_init "$@"
}

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
