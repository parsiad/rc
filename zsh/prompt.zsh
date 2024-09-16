setopt PROMPT_SUBST

if command -v hostname &> /dev/null; then
    HOSTNAME=$(hostname -s)
else
    HOSTNAME="?"
fi

git_super_status() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) != true ]] || [[ -f "$(git rev-parse --show-toplevel 2> /dev/null)/.disable-git-prompt" ]]; then
        return
    fi
    echo ' %F{5}'$(git symbolic-ref --short HEAD 2> /dev/null || git describe --tags --exact-match 2> /dev/null)
}

PROMPT='%F{3}$HOSTNAME%F{4} %F{2}$(sed "s:\([^/]\)[^/]*/:\1/:g" <<<$PWD)$(git_super_status)%F{4}> %f'
