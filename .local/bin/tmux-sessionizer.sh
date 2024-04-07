#!/usr/bin/env bash
PROJECTS=$(find ~/projects -mindepth 1 -maxdepth 1 -type d)
EXTRA=("$HOME" "$HOME/.dotfiles" "$HOME/.dotfiles/.config/nvim" "$HOME/personal" "$HOME/.local/share/nvim/lazy" "$WIN")
PRESETS=("tmux-vscubing" "tmux-imaginaer")
SELECTED=$(echo "$PROJECTS ${EXTRA[*]} ${PRESETS[*]}" | tr ' ' '\n' | fzf)

if [[ -z $SELECTED ]]; then
    exit 1
fi

# if is a preset
if echo "${PRESETS[@]}" | grep $SELECTED> /dev/null; then
    echo "${PRESETS[@]}" | grep $SELECTED
    tmux neww "~/.local/bin/tmux-presets/$SELECTED.sh"
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
