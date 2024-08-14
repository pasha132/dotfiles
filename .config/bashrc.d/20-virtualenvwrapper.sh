# shellcheck shell=bash

load() {
    # virtualenvwrapper
    local python
    python="$(command -v python3.11)"
    export VIRTUALENVWRAPPER_PYTHON="$python"
    export VIRTUALENVWRAPPER_HOOK_DIR="$HOME/.cache/virtualenvs"
    export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
    export WORKON_HOME="$HOME/.cache/virtualenvs"
    export PROJECT_HOME="$HOME/Documents/projects"
    . /usr/bin/virtualenvwrapper_lazy.sh
}

[ -f /usr/bin/virtualenvwrapper_lazy.sh ] && load
