#!/usr/bin/env bash

# Copy selection
tmux send-keys -X copy-selection

selected_text=$(tmux show-buffer)

if [[ -f /tmp/.tmux-biff-buffer-check ]]; then
    tmux copy-mode -q

    echo $selected_text > /tmp/.tmux-biff-buffer-check-2

    mv /tmp/.tmux-biff-buffer-check /tmp/.tmux-biff-buffer-check-1

    tmux new-window 'diff -u -U 9999 /tmp/.tmux-biff-buffer-check-1 /tmp/.tmux-biff-buffer-check-2 | delta --side-by-side --wrap-max-lines 99; read -n 1'
else
    echo $selected_text > /tmp/.tmux-biff-buffer-check
fi

