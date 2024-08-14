# shellcheck shell=bash

# affix colons on either side of $PATH to simplify matching
case ":${PATH}:" in
    *:"$HOME/bin":*)
        ;;
    *)
        export PATH="$HOME/bin:$PATH"
        ;;
esac
