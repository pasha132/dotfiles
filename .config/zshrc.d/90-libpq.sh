# shellcheck shell=bash

BREW_PREFIX="/opt/homebrew/opt/libpq" # $(brew --prefix libpq)

# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"${BREW_PREFIX}/bin":*)
        ;;
    *)
        # Prepending path in case a system-installed go needs to be overridden
        export PATH="${BREW_PREFIX}/bin:$PATH"
        ;;
esac
