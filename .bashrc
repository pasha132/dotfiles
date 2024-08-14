# /etc/skel/.bashrc
# shellcheck shell=bash
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.

if [[ $- != *i* ]] ; then
    # Shell is non-interactive.  Be done now!
    return
fi

function tmux_allowed() {
    # check for vscode CWD when running from App
    [ -v VSCODE_CWD ] && return 1
    # check for PROGRAM when running insode application
    [ "${TERM_PROGRAM:-}" = "vscode" ] && return 1
    # check for nested tmux
    [ -n "$TMUX" ] && return 1
    return 0
}

if tmux_allowed; then
    command tmux attach-session 2>/dev/null || exec tmux new-session
fi

# exclude 00-*.sh because they already sourced from .bash_profile
for sh in $(find ~/.config/bashrc.d \( -type f -o -type l \) -name '*.sh' -not -name '00-*.sh' | sort); do
    . "${sh}"
done

eval "$(starship init bash)"
