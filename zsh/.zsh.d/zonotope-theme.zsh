############################################################################
# initialize prompt system                                                 #
############################################################################

## enable the prompt subsystem
setopt PROMPT_SUBST

## enable prompt colors
autoload -U colors && colors

############################################################################
# initialize vcs_info (only git for now)                                   #
############################################################################

## load vcs_info module
autoload -Uz vcs_info

## enable the git vcs_info back end
zstyle ':vcs_info:*' enable git

## check for local changes
zstyle ':vcs_info:*' check-for-changes true

## build the status message before rendering the prompt
precmd() {
    vcs_info
}

# rebuild the status message when changing directories
prompt_chpwd() {
    FORCE_RUN_VCS_INFO=1
}
add-zsh-hook chpwd prompt_chpwd

############################################################################
# vcs theme                                                                #
############################################################################

## show a marker whenever there are either staged or unstaged changes
zstyle ':vcs_info:*:*' unstagedstr "%{$fg_bold[yellow]%}◦%{$reset_color%}"
zstyle ':vcs_info:*:*' stagedstr "%{$fg_bold[yellow]%}∙%{$reset_color%}"

## set prompt git status message format
zstyle ':vcs_info:git*' formats "(%{$fg[green]%}%s:%b%{$reset_color%}%c%u%m)"
zstyle ':vcs_info:git*' actionformats "(%{$fg[green]%}%s:%b%{$reset_color%}\
%c%u%m|%{$fg[cyan]%}%a%{$reset_color%})"

## show ↑n/↓n when the local branch is ahead/behind remote HEAD
function +vi-git-st() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]]; then
        local ahead behind
        local -a commits

        # unpushed commits
        ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null |
                    wc -l | tr -d '[:space:]')

        (( $ahead )) && commits+=( "%{$fg[yellow]%}↑${ahead}%{$reset_color%}" )


        # unpulled commits
        behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null |
                     wc -l | tr -d '[:space:]')

        (( $behind )) && commits+=( "%{$fg[red]%}↓${behind}%{$reset_color%}")


        # commit status
        if [ ${#commits[@]} -gt 0 ]; then
            hook_com[misc]+=" ${(j:/:)commits}"
        fi
    fi
}

## set the prompt hooks
zstyle ':vcs_info:git*+set-message:*' hooks git-st

############################################################################
# prompt                                                                   #
############################################################################

## red username for root, yellow for everyone else
if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

## main prompt. 3 lines:
# 1. dividing line of dashes (-)
# 2. username@hostname:working/directory/ (possible git status)
# 3. %/# >
PROMPT=$'
%{$fg_bold[grey]%}%
-------------------------------------------------------%
%{$reset_color%}
%{$fg[$NCOLOR]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}:%
%{$fg[blue]%}%~/%{$reset_color%} %
${vcs_info_msg_0_}
%{$fg_bold[black]%}%# >%{$reset_color%} '

## loop/multi-line command prompt
PROMPT2="%{$fg_bold[black]%}%_> %{$reset_color%}"

## selection prompt
PROMPT3="%{$fg_bold[black]%}...> %{$reset_color%}"

## date and time in the right prompt. eg: [06/22/2013 12:59PM]
RPROMPT="%{$fg_bold[grey]%}[%T]%{$reset_color%}"

## reset the prompt on <enter> for accurate command start times
function _reset-prompt-and-accept-line {
    zle reset-prompt
    zle .accept-line
}
zle -N accept-line _reset-prompt-and-accept-line
