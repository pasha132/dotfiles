# shellcheck shell=bash

# Create new or attach to existing tmux session
#   tmux
alias tmux='{ export LANG=en_US.UTF-8; tmux a || tmux; }'

function ssht() {
    settitle "$@"
    command ssh -ttt "$@" "{ export LANG=en_US.UTF-8; tmux attach-session 2>/dev/null || { sleep 1; exec tmux new-session; }; }"
    settitle "$(basename "$SHELL")"
}

function settitle() {
    if [ -n "$TMUX" ] && [ -n "$TMUX_PANE" ]; then
        command tmux rename-window -t "${TMUX_PANE}" "$1"
    fi
}
