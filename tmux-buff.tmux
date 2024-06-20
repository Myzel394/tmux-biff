#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

tmux bind-key -T copy-mode v run-shell "$CURRENT_DIR/plugin.sh"
tmux bind-key -T copy-mode-vi v run-shell "$CURRENT_DIR/plugin.sh"

