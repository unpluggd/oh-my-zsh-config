function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo '»'
}

PROMPT='
%{$fg[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info) 
$(prompt_char) '
RPROMPT=''

ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %{$fg[orange]%}✚"
