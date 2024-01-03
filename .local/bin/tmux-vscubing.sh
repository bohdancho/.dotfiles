#!/usr/bin/env bash

# Set Session Name
SESSION="VSCubing"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]; then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # Window 1: vscubing-frontend
    tmux new-window -t $SESSION:1 -n 'vscubing-frontend'
    tmux send-keys -t 'vscubing-frontend' 'cd ~/projects/vscubing/vscubing-frontend' C-m 'vim' C-m

    # Window 2: vscubing-frontend - Run dev server
    tmux new-window -t $SESSION:2 -n 'vscubing-frontend-dev'
    tmux send-keys -t 'vscubing-frontend-dev' 'cd ~/projects/vscubing/vscubing-frontend' C-m 'bun run dev' C-m

    # Window 3: vscubing-backend
    tmux new-window -t $SESSION:3 -n 'vscubing-backend'
    tmux send-keys -t 'vscubing-backend' 'cd ~/projects/vscubing/vscubing-backend' C-m 'source venv/bin/activate' C-m 'python3 manage.py runserver' C-m

    # Window 4: alg.cubing.net
    tmux new-window -t $SESSION:4 -n 'alg.cubing.net'
    tmux send-keys -t 'alg.cubing.net' 'cd ~/projects/vscubing/alg.cubing.net' C-m 'live-server src/alg.cubing.net --no-browser' C-m

    # Window 5: cstimer
    tmux new-window -t $SESSION:5 -n 'cstimer'
    tmux send-keys -t 'cstimer' 'cd ~/projects/vscubing/cstimer' C-m 'make' C-m 'php -S 127.0.0.1:8081 -t dist' C-m
fi

# Attach Session, on the first window
tmux switch-client -t $SESSION:1
