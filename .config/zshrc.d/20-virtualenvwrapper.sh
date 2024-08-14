# shellcheck shell=bash

load() {
    [ -f "$HOME/.config/zshrc.d/local.sh" ] && source "$HOME/.config/zshrc.d/local.sh"
    # virtualenvwrapper
    export VIRTUALENVWRAPPER_PYTHON="${LOCAL_PYTHON:-"$(command -v python3.12)"}"
    export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.cache/virtualenvs"
    export VIRTUALENVWRAPPER_SCRIPT=/opt/homebrew/bin/virtualenvwrapper.sh
    export WORKON_HOME="$HOME/.cache/virtualenvs"
    export PROJECT_HOME="$HOME/Documents/projects"
    source /opt/homebrew/bin/virtualenvwrapper_lazy.sh
}

[ -f /opt/homebrew/bin/virtualenvwrapper_lazy.sh ] && load
