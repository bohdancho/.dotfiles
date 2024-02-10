#!/usr/bin/env bash
PROJECTS=$(find ~/projects ~/projects/vscubing -mindepth 1 -maxdepth 1 -type d)
EXTRA=("$HOME" "$HOME/.dotfiles" "$HOME/.dotfiles/.config/nvim")
SELECTED=$(echo "$PROJECTS ${EXTRA[*]}" | tr ' ' '\n' | fzf)

if [[ -z $SELECTED ]]; then
    exit 0
fi

SELECTED_NAME=$(basename "$SELECTED" | tr . _)

if [[ $1 == "window" ]]; then
    tmux new-window -n $SELECTED_NAME -c $SELECTED
elif [[ $1 == "session" ]]; then
    tmux new-session -ds $SELECTED_NAME -c $SELECTED
    tmux rename-window -t $SELECTED_NAME:1 $SELECTED_NAME
    tmux switch-client -t $SELECTED_NAME
else
    echo "Usage: $0 [window|session]"
    exit 1
fi
    
# tmux send-keys "nvim" C-m
