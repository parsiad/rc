setopt PROMPT_SUBST

if command -v hostname &> /dev/null; then
    HOSTNAME=$(hostname -s)
else
    HOSTNAME="?"
fi

PROMPT='%F{4}[%F{3}$HOSTNAME%F{4}] %F{2}$(sed "s:\([^/]\)[^/]*/:\1/:g" <<<$PWD)%F{4}> %f'
