command -v batcat &> /dev/null && alias bat=batcat
command -v btop &> /dev/null && alias top=btop
command -v colordiff &> /dev/null && alias diff=colordiff
command -v exa &> /dev/null && alias ls='exa -H -g' || alias ls='ls --color=auto'
command -v nvim &> /dev/null && { alias vim=nvim; export MANPAGER='nvim +Man!'; }

alias decrypt-id_rsa='gpg --decrypt ~/.password-store/keys/id_rsa.gpg | ssh-add -t 60 -'
alias g=git
alias git-authors='git shortlog --email --summary --numbered'
alias git-sha='git rev-parse --short HEAD'
alias git-tips='git branch | cut -c 2- | while read line; do git log --color --format="%h %C(green)%ci %C(magenta)%<(20)%cr %C(blue)%<(20)%an %C(cyan)$line %C(reset)[%s] %C(reset)" $line | head -n 1; done | sort -r'
alias l='ls -l'
alias la='ls -la'
alias ll=l
alias pacman-age='head -n1 /var/log/pacman.log | cut -d'\'' '\'' -f1 | cut -c 2-'
alias pacman-ls-by-size='pacman -Qi | awk '\''/^Name/ {name=$3} /^Installed Size/ {size=$4; size_hint=$5;printf "%4.0f%-3s    %s\n", size, size_hint, name}'\'' | sort -h -r'
alias pacman-rm-orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias path='tr '\'':'\'' '\''\n'\'' <<< $PATH'
alias services='systemctl list-unit-files --type=service'
alias ssh='decrypt-id_rsa && ssh'
alias sftp='decrypt-id_rsa && sftp'
alias vi=vim

bin2dec() { echo "ibase=2 ;           $1" | bc -l }
bin2hex() { echo "ibase=2 ; obase=16; $1" | bc -l }
dec2bin() { echo "          obase=2 ; $1" | bc -l }
dec2hex() { echo "          obase=16; $1" | bc -l }
hex2bin() { echo "ibase=16; obase=2 ; $1" | bc -l }
hex2dec() { echo "ibase=16;           $1" | bc -l }
json-diff() { diff <(jq -S . "$1") <(jq -S . "$2") }
md5sum-dir() { find $1 -type f -exec md5sum {} \; | sort -k 2 | md5sum }
