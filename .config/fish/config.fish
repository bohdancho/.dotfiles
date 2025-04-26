set PATH /Users/bohdan/.rd/bin $PATH

export GPG_TTY=$(tty)

eval "$(/opt/homebrew/bin/brew shellenv)"
source $HOME/.config/fish/wifi.fish
source $HOME/.config/fish/goldbeck.fish
set fish_greeting "sup nerds"

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

fish_add_path /Users/bohdan/.local/bin

fish_add_path /opt/homebrew/opt/ruby/bin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=/Users/bohdan/Library/Android/sdk
fish_add_path $ANDROID_HOME/emulator
fish_add_path $ANDROID_HOME/platform-tools
