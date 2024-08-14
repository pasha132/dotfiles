# /etc/skel/.bash_profile
# shellcheck shell=bash

for sh in $(find ~/.config/bashrc.d \( -type f -o -type l \) -name '00-*.sh' | sort); do
    . "${sh}"
done

# This file is sourced by bash for login shells.  The following line
# runs your .bashrc and is recommended by the bash info pages.
[ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
