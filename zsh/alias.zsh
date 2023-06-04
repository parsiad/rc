if command -v batcat &> /dev/null
then
    alias bat=batcat
fi

if command -v exa &> /dev/null
then
    alias ls='exa -g'
elif [ $(uname -a | awk '{print $1}') = 'Darwin' ]
then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

if command -v colordiff &> /dev/null
then
    alias diff='colordiff'
fi

alias blaze=bazel

alias git-authors='git shortlog --email --summary --numbered'
alias git-sha='git rev-parse --short HEAD'
alias git-tips='git branch | cut -c 2- | while read line; do git log --color --format="%C(green)%ci %C(magenta)%<(20)%cr %C(blue)%<(20)%an %C(cyan)$line %C(reset)[%s] %C(reset)" $line | head -n 1; done | sort -r'

git-experiment() {
    git worktree add $1/$(date +%Y%m%d-%H%M%S)_$(uuidgen)_$(git rev-parse --abbrev-ref HEAD | sed -e 's/[^A-Za-z0-9._-]/_/g')
}

alias l='ls -l'
alias la='ls -la'
alias ll=l

alias pacman-age='head -n1 /var/log/pacman.log | cut -d'\'' '\'' -f1 | cut -c 2-'
alias pacman-list-by-size='pacman -Qi | awk '\''/^Name/ {name=$3} /^Installed Size/ {size=$4; size_hint=$5;printf "%4.0f%-3s    %s\n", size, size_hint, name}'\'' | sort -h -r'
alias pacman-modified='pacman -Qii | awk '\''/^MODIFIED/ {print $2}'\'
alias pacman-rm-orphans='sudo pacman -Rns $(pacman -Qtdq)'

alias path='tr '\'':'\'' '\''\n'\'' <<< $PATH'

alias services='systemctl list-unit-files --type=service'

alias omw='portmod openmw'

alias open='xdg-open'

if command -v nvim &> /dev/null
then
    alias vim=nvim
fi
alias vi=vim

cheat() {
    curl cheat.sh/$1
}

md5sum-dir () {
    find $1 -type f -exec md5sum {} \; | sort -k 2 | md5sum
}

bin2dec() { echo "ibase=2 ;           $1" | bc -l }
bin2hex() { echo "ibase=2 ; obase=16; $1" | bc -l }
dec2bin() { echo "          obase=2 ; $1" | bc -l }
dec2hex() { echo "          obase=16; $1" | bc -l }
hex2bin() { echo "ibase=16; obase=2 ; $1" | bc -l }
hex2dec() { echo "ibase=16;           $1" | bc -l }
