setopt PROMPT_SUBST
PROMPT='%F{4}[%F{3}$(hostname -s)%F{4}] %F{2}$(sed "s:\([^/]\)[^/]*/:\1/:g" <<<$PWD)%F{4}> %f'
