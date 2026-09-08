# History options
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt SHARE_HISTORY          # Share history across all sessions in real-time
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries
setopt HIST_IGNORE_SPACE      # Don't record commands starting with a space
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries to file
setopt HIST_REDUCE_BLANKS     # Remove unnecessary blanks from commands
setopt EXTENDED_HISTORY       # Save timestamps and duration
setopt autocd                 # change dir without cd

# Set name of the theme to load 
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
    source $HOME/.zsh/themes/oxide-ssh.zsh-theme
else
    source $HOME/.zsh/themes/oxide.zsh-theme
fi

# auto suggestions for zsh
source $HOME/.zsh/plugins/zsh-autosuggestions.zsh

# add .local/bin to path
export PATH="$HOME/.local/bin:$PATH"

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

# fzf
source <(fzf --zsh)

# zoxide
eval "$(zoxide init zsh)"

# fnm
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$HOME/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# Lazy-load conda: initialize only when conda is first used
function conda() {
    unset -f conda
    __conda_setup="$('$HOME/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
    conda "$@"
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
