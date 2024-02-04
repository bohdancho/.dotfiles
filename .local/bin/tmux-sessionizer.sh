#!/usr/bin/env bash
PROJECTS=$(find ~/projects -mindepth 1 -maxdepth 1 -type d)
EXTRA=("$HOME/.config/nvim" "$HOME")
SELECTED=$(echo "$PROJECTS ${EXTRA[*]}" | tr ' ' '\n' | fzf)

if [[ -z $SELECTED ]]; then
    exit 0
fi

SELECTED_NAME=$(basename "$SELECTED" | tr . _)

tmux new-window -n $SELECTED_NAME -c $SELECTED
