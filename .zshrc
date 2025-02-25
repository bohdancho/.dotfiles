### WARN: CURRENTLY NOT USED

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/bohdan/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

eval "$(/opt/homebrew/bin/brew shellenv)"
alias wifi="sshpass -p RJVKDWA3 ssh 194388@139.18.143.253"
echo "sup nerds"

# my custom stuff
alias "vim"="nvim"

alias "cat"="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git/"'

eval "$(starship init zsh)"

if [[ -z "$TMUX" ]]; then
    if ! tmux attach; then
        tmux new-session -ds sup-nerd "~/.local/bin/tmux-sessionizer session" 
        tmux attach
    fi
fi

fzv() {
    ORIGINAL_PWD=$PWD
    if [[ ! -z $1 ]]; then
        cd $1
    fi
    SELECTED=$(fzf)

    if [[ -z $SELECTED ]]; then
        cd $ORIGINAL_PWD
        return
    fi

    nvim $SELECTED && cd $ORIGINAL_PWD
}

killp () {
    kill -9 $(lsof -t -i:$1)
}

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

export PATH="$PATH:/opt/nvim-linux64/bin"

# bun completions
[ -s "/Users/bohdan/.bun/_bun" ] && source "/Users/bohdan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/sqlpackage:$PATH"
