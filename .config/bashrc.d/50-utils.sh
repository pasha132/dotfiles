# shellcheck shell=bash

# Create new or attach to existing tmux session
#   tmux
alias tmux='{ export LANG=en_US.UTF-8; tmux a || tmux; }'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

function lsdom() {
    local _domain="";
    for _domain in $(virsh -q list --state-running --name); do
        echo "${_domain} $(dig @192.168.122.1 +short "${_domain}.libvirt")";
    done
}

function ssht() {
    settitle "$@"
    command ssh -ttt "$@" "{ export LANG=en_US.UTF-8; tmux attach-session 2>/dev/null || { sleep 1; exec tmux new-session; }; }"
    settitle "bash"
}

function settitle() {
    if [ -n "$TMUX" ] && [ -n "$TMUX_PANE" ]; then
        command tmux rename-window -t "${TMUX_PANE}" "$1"
    fi
}
