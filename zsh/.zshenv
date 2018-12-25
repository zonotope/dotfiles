## my name
export NAME="ben lamothe"

## locale (american english)
export LANG=en_US.UTF-8

## arch compilation flags
export ARCHFLAGS="-arch x86_64"

############################################################################
# shell                                                                    #
############################################################################

export SHELL=$(which zsh)

## main zsh configuration directory
export ZSHD=$HOME/.zsh.d

## cache
export ZSH_CACHE_DIR=$ZSHD/cache

############################################################################
# colors                                                                   #
############################################################################

# Linux
export LS_COLORS="di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32"

# BSD/Mac OS
export LSCOLORS="ExGxFxDxCxDxDxhbhdacEc"

############################################################################
# pager                                                                    #
############################################################################

export PAGER="less"

# (RAW-CONTROL-CHARS display cotrol output (including color escape sequeces))
export LESS="--RAW-CONTROL-CHARS --squeeze-blank-lines --ignore-case"

# colorize less output
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# highlight source code if source-highlight is installed
SOURCE_HIGHLIGHT=$(command -v source-highlight-esc.sh 2> /dev/null)
if [ "$TERM" != dumb ] && [ -n "$SOURCE_HIGHLIGHT" ]; then
    export LESSOPEN="| $SOURCE_HIGHLIGHT %s"
fi
unset SOURCE_HIGHLIGHT

############################################################################
# editor                                                                   #
############################################################################

export EDITOR="emacsclient --create-frame --alternate-editor=emacs"
export VISUAL="emacsclient --create-frame"
export ALTERNATE_EDITOR="" # allows emacsclient to start a daemon if one isn't
                           # already running

############################################################################
# browser                                                                  #
############################################################################

if [ -n "$DISPLAY" ]; then
    export BROWSER="chromium"
else
    export BROWSER="w3m"
fi

############################################################################
# search                                                                   #
############################################################################

## grep highlight color (orange)
export GREP_COLOR="1;33"
