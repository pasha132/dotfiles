# shellcheck shell=bash

load() {
    # virtualenvwrapper
    export VIRTUALENVWRAPPER_PYTHON=$(command -v python3.10)
    export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.cache/virtualenvs"
    export VIRTUALENVWRAPPER_SCRIPT=/opt/homebrew/bin/virtualenvwrapper.sh
    export WORKON_HOME="$HOME/.cache/virtualenvs"
    export PROJECT_HOME="$HOME/Documents/projects"
    source /opt/homebrew/bin/virtualenvwrapper_lazy.sh
}

[ -f /opt/homebrew/bin/virtualenvwrapper_lazy.sh ] && load
