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

alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gp='git pull'
alias gr='git rebase'
alias gs='git status'

alias git-authors='git shortlog --email --summary --numbered'
alias git-branch='git branch | grep -v + | less'
alias git-sha='git rev-parse --short HEAD'
alias git-tips='git branch | cut -c 2- | while read line; do git log --color --format="%h %C(green)%ci %C(magenta)%<(20)%cr %C(blue)%<(20)%an %C(cyan)$line %C(reset)[%s] %C(reset)" $line | head -n 1; done | sort -r'

git-path() {
    if [ $# -ne 1 ]; then
        echo "usage: git-path BRANCH" >&2
        return 1
    fi
    count=$(git worktree list | grep -c $1)
    if [ "$count" -eq 1 ]; then
        echo $(git worktree list | grep $1 | awk '{ print $1 }')
    elif [ "$count" -gt 1 ]; then
        echo "error: git-path found more than one worktree path" >&2
        return 1
    else
        echo "error: git-path found no worktree paths" >&2
        return 1
    fi
}

git-new() {
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "usage: git-experiment PATH [SUFFIX]" >&2
        return 1
    fi
    local worktree_path="$1/$(date +%Y%m%d-%H%M%S)_$(basename $(git rev-parse --show-toplevel))_$(git rev-parse --abbrev-ref HEAD | sed -e 's/[^A-Za-z0-9._-]/_/g')_$(git rev-parse --short HEAD)"
    if [ $# -eq 2 ]; then
        local worktree_path="${worktree_path}_$2"
    fi
    git worktree add "$worktree_path" &&
    git -C "$worktree_path" submodule update --init --recursive &&
    echo "Experiment at '$worktree_path'" >&2
}

git-del() {
    if [ $# -ne 1 ]; then
        echo "usage: git-path BRANCH" >&2
        return 1
    fi
    echo -n "Are you sure you want to delete $1? [y/N]: " >&2
    read reply
    if [[ $reply =~ ^[Yy]$ ]]; then
        rm -r $(git-path $1)
        git worktree remove $1
        git branch -D $1
    fi
}

git-checkout() {
    git checkout $1 && git submodule update --init --recursive
}

alias sq='squeue -o "%.12i %.16u %.24P %.32j %.4t %.12M %.8D %.20R"'

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
    export MANPAGER='nvim +Man!'
fi
alias vi=vim

cheat() {
    curl cheat.sh/$1
}

md5sum-dir () {
    find $1 -type f -exec md5sum {} \; | sort -k 2 | md5sum
}

function ptop() {
  if [ "$#" -ne 1 ]; then
    echo "usage: ptop PATTERN"
    return 1
  fi
  top -p $(pgrep -d, $1)
}

bin2dec() { echo "ibase=2 ;           $1" | bc -l }
bin2hex() { echo "ibase=2 ; obase=16; $1" | bc -l }
dec2bin() { echo "          obase=2 ; $1" | bc -l }
dec2hex() { echo "          obase=16; $1" | bc -l }
hex2bin() { echo "ibase=16; obase=2 ; $1" | bc -l }
hex2dec() { echo "ibase=16;           $1" | bc -l }
