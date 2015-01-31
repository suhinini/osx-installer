function virtualenv_info {
    [ $VIRTUAL_ENV ] && echo '('`basename $VIRTUAL_ENV`') '
}
 
function box_name {
    [ -f ~/.box-name ] && cat ~/.box-name || hostname -s
}
 
function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '☿' && return
    hg root >/dev/null 2>/dev/null && echo '=' && return
    echo '>'
}
 
PROMPT='
%{$fg[yellow]%}>>%{$reset_color%} %* %{$fg[yellow]%}>%{$reset_color%} %{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}$(box_name)%{$reset_color%} in %{$fg_bold[green]%}${PWD/#$HOME/~}%{$reset_color%}$(git_prompt_info)
$(virtualenv_info)%(?,,%{${fg_bold[white]}%}[%?]%{$reset_color%} )%{$fg[yellow]%}$(prompt_char)%{$reset_color%} '
 
ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
ZSH_THEME_GIT_PROMPT_CLEAN=""
 
local return_status="%{$fg[red]%}%(?..✘)%{$reset_color%}"
RPROMPT='${return_status}%{$reset_color%}'