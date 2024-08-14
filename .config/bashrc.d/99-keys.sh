# shellcheck shell=bash

find ~/.ssh -type f -iname 'id_*' -not -iname 'id_*.pub' -print0 \
| xargs -0 -n1 sh -c '/usr/bin/ssh-add -q "$0" 2>&1'
