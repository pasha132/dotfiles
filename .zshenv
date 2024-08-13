for sh in $(find ~/.config/zshrc.d \( -type f -o -type l \) -name '90-*.sh' | sort); do
    source "${sh}"
done
