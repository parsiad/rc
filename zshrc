source $HOME/.alias.zsh

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
export EDITOR=nvim
export PATH="$PATH:/opt/miniconda3/bin:$HOME/bin"

# Edit command in Vi by pressing \\
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd \\ edit-command-line

# Vi mode
bindkey -v
export KEYTIMEOUT=1

# Do not select pasted text (https://unix.stackexchange.com/questions/331850/zsh-selects-a-pasted-text)
zle_highlight=('paste:none')

# Set prompt string
setopt PROMPT_SUBST
HOSTNAME=$(command -v hostname &>/dev/null && hostname -s || echo "?")
git_super_status() {
  [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) != true ]] && return
  [[ -f "$(git rev-parse --show-toplevel 2>/dev/null)/.disable-git-prompt" ]] && return
  echo " %F{5}$(git symbolic-ref --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)"
}
PROMPT='%F{3}$HOSTNAME%F{4} %F{2}$(sed "s:\([^/]\)[^/]*/:\1/:g" <<<"$PWD")$(git_super_status)%F{4}> %f'

# Change behavior of Home, End, etc. keys (https://zshwiki.org/home/keybindings/)
typeset -g -A key
key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[ShiftTab]="${terminfo[kcbt]}"
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  end-of-buffer-or-history
[[ -n "${key[ShiftTab]}"  ]] && bindkey -- "${key[ShiftTab]}"  reverse-menu-complete
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start {
    echoti smkx
  }
  function zle_application_mode_stop {
    echoti rmkx
  }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

# Tab completion
autoload -U compinit
compinit
zmodload -i zsh/complist
zstyle ':completion:*' menu select

# History
setopt share_history
HISTSIZE=999999999
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history

# fzf
[[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null
source "$HOME/.fzf/shell/key-bindings.zsh"

eval "$(direnv hook zsh)"

eval "$(zoxide init zsh)"

# Lazy-load Conda hook on first use
conda() {
    unset -f conda
    eval "$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook')"
    conda "$@"
}
