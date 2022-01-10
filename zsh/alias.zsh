if command -v exa &> /dev/null
then
    alias ls='exa'
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

if command -v colormake &> /dev/null
then
    alias make='colormake'
fi

alias blaze=bazel
alias git-sha='git rev-parse --short HEAD'
alias l='ls -l'
alias la='ls -la'
alias ll=l
alias pacman-list-by-size='pacman -Qi | awk '\''/^Name/ {name=$3} /^Installed Size/ {size=$4; size_hint=$5;printf "%4.0f%-3s    %s\n", size, size_hint, name}'\'' | sort -h -r'
alias pacman-rm-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias services='systemctl list-unit-files --type=service'
alias omw='portmod openmw'
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
