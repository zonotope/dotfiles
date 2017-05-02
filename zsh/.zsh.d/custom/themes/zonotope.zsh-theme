if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

# git config
GIT_CB="git:"
ZSH_THEME_SCM_PROMPT_PREFIX="%{$fg[cyan]%}("
ZSH_THEME_GIT_PROMPT_PREFIX=$ZSH_THEME_SCM_PROMPT_PREFIX$GIT_CB
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# main prompt
PROMPT=$'
%{$fg_bold[black]%}%
--------------------------------------------------%
%{$reset_color%}
%{$fg_bold[$NCOLOR]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%
%{$fg[blue]%}%~/%{$reset_color%} %
$(git_prompt_info)
%{$fg_bold[black]%}%# >%{$reset_color%} '

PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

# right prompt. eg: [12:59PM]
RPROMPT='%{$fg[white]%}[%t]%{$reset_color%}'

# reset the prompt on <enter> for accurate command start times
function _reset-prompt-and-accept-line {
         zle reset-prompt
         zle .accept-line
}
zle -N accept-line _reset-prompt-and-accept-line
