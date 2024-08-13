# shellcheck shell=bash

source $HOME/.config/zshrc.d/local.sh

BREW_PREFIX="/opt/homebrew/opt/go" # $(brew --prefix golang)
export GOPATH="${GOPATH_LOCAL:-$HOME/Documents/go}"
export GOROOT="$BREW_PREFIX/libexec"

for env in "${GOPATH}/bin" "${GOROOT}/bin"; do
    # affix colons on either side of $PATH to simplify matching
    case ":${PATH}:" in
        *:"${env}":*)
            ;;
        *)
            # Prepending path in case a system-installed go needs to be overridden
            export PATH="${env}:$PATH"
        ;;
    esac
done
