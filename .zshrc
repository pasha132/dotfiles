function tmux_allowed() {
    # check for vscode CWD when running from App
    [ -v VSCODE_CWD ] && return 1
    # check for PROGRAM when running insode application
    [ "${TERM_PROGRAM:-}" = "vscode" ] && return 1
    # check for nested tmux
    [ -n "$TMUX" ] && return 1
    return 0
}

if (tmux_allowed); then
    command tmux attach-session 2>/dev/null || exec tmux new-session
fi

# exclude 90-*.sh because they already sourced from .zshenv
for sh in $(find ~/.config/zshrc.d \( -type f -o -type l \) -name '*.sh' -not -name '90-*.sh' | sort); do
    source "${sh}"
done

fpath+=${ZDOTDIR:-~}/.zsh_functions
eval "$(/opt/homebrew/bin/starship init zsh)"
