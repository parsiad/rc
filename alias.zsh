if command -v exa &> /dev/null
then
    alias ls='exa'
else
    alias ls='ls --color=auto'
fi

alias l='ls -l'
alias la='ls -la'
alias ll=l

alias pacman-list-by-size='pacman -Qi | awk '\''/^Name/ {name=$3} /^Installed Size/ {size=$4; size_hint=$5;printf "%4.0f%-3s    %s\n", size, size_hint, name}'\'' | sort -h -r'
alias pacman-rm-orphans='sudo pacman -Rns $(pacman -Qtdq)'

alias top=htop

alias vi=vim

alias blaze=bazel

md5sum-dir () {
    find $1 -type f -exec md5sum {} \; | sort -k 2 | md5sum
}
