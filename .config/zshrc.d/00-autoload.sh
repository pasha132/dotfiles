# shellcheck shell=bash

autoload -Uz edit-command-line
zle -N edit-command-line
#bindkey -M vicmd v edit-command-line
bindkey '^x^e' edit-command-line
bindkey "^[f" forward-word
bindkey "^[b" backward-word

autoload -U compinit
compinit

unix-word-rubout() {
    local WORDCHARS=$'!"#$%&\'()*+,-./:;<=>?@[\\]^_`{|}~'
    zle backward-kill-word
}

zle -N unix-word-rubout
bindkey '^W' unix-word-rubout
