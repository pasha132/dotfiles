# shellcheck shell=bash

load() {
    export FZF_DEFAULT_OPTS='--height 80% --layout=reverse' 

    # CTRL-/ to toggle small preview window to see the full command
    # CTRL-Y to copy the command into clipboard using pbcopy
    export FZF_CTRL_R_OPTS="
      --preview 'echo {}' --preview-window up:3:hidden:wrap
      --bind 'ctrl-/:toggle-preview'
      --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
      --color header:italic
      --color 'bg+:242,gutter:-1'
      --header 'Press CTRL-Y to copy command into clipboard'"

    eval "$(fzf --bash)"
}

command -v fzf &>/dev/null && load
