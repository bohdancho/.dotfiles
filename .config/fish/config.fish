set PATH /Users/bohdan/.rd/bin $PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
source $HOME/.config/fish/wifi.fish
source $HOME/.config/fish/goldbeck.fish
set fish_greeting "sup nerds"

# my custom stuff
alias "vim"="nvim"

alias "cat"="bat"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!.git/"'
export EDITOR=nvim

starship init fish | source

if test -z "$TMUX"
    if not tmux attach
        tmux new-session -ds sup-nerd "~/.local/bin/tmux-sessionizer session"
        tmux attach
    end
end

# pnpm
set -gx PNPM_HOME "/Users/bohdan/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export PATH="$HOME/sqlpackage:$PATH"

# Created by `pipx` on 2025-02-25 18:00:50
set PATH $PATH /Users/bohdan/.local/bin
