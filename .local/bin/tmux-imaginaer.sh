#!/usr/bin/env bash

# Set Session Name
SESSION="tmux-imaginaer"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

if [ "$SESSIONEXISTS" = "" ]; then
    tmux new-session -d -s $SESSION -c "$HOME/projects/imaginaer"

    tmux rename-window -t $SESSION:1 'frontend'
    tmux send-keys -t $SESSION:1 'cd ~/projects/imaginaer/frontend' C-m 'vim' C-m

    tmux new-window -t $SESSION:2 -n 'frontend-server'
    tmux send-keys -t $SESSION:2 'cd ~/projects/imaginaer/frontend' C-m 'pnpm start --open' C-m

    tmux new-window -t $SESSION:3 -n 'backend'
    tmux send-keys -t $SESSION:3 'cd ~/projects/imaginaer/backend' C-m 'vim' C-m

    tmux new-window -t $SESSION:4 -n 'backend-server'
    tmux send-keys -t $SESSION:4 'cd ~/projects/imaginaer/backend' C-m 'air' C-m

fi

tmux switch-client -t $SESSION:1
