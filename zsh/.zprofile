## start the x server if we're on linux and it isn't started already
if [ "$(uname)" = "Linux" ] && [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi

## set the colors
if [[ "$OSTYPE" == darwin* ]]; then
    # this is a good alias, it works by default just using $LSCOLORS
    ls -G . &>/dev/null && alias ls='ls -G'

    # only use coreutils ls if there is a dircolors customization present
    # ($LS_COLORS or .dircolors file) otherwise, gls will use the default color
    # scheme which is ugly af
    [[ -n "$LS_COLORS" || -f "$HOME/.dircolors" ]] && gls --color -d . &>/dev/null && alias ls='gls --color=tty'
else
    # For GNU ls, we use the default ls color theme. They can later be
    # overwritten by themes.
    if [[ -z "$LS_COLORS" ]]; then
        (( $+commands[dircolors] )) && eval "$(dircolors -b)"
    fi

    ls --color -d . &>/dev/null && alias ls='ls --color=tty' || { ls -G . &>/dev/null && alias ls='ls -G' }

    # Take advantage of $LS_COLORS for completion as well.
    zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

## term cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

## print a fortune on log in:
echo
fortune
echo
