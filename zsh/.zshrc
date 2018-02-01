# oh-my-zsh installation.
export ZSH=$HOME/.zsh.d/oh-my-zsh

# custom code directory
ZSH_CUSTOM=$HOME/.zsh.d/custom

# theme name. look in $ZSH/themes/
# optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="zonotope"

# load experimental completions
fpath=($ZSH_CUSTOM/zsh-completions/src $fpath)

# completion options
## case-sensitive completion?
CASE_SENSITIVE="true"

# red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# history timestamp format
HIST_STAMPS="yyyy-mm-dd" # valid formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# user configuration
## set the syntax highligters

# plugins load. (plugins can be found in $ZSH/plugins/*) Custom plugins may
# be added to $ZSH_CUSTOM/plugins/
# example format: plugins=(rails git textmate ruby lighthouse)
# add wisely. too many plugins slow down shell startup.
plugins=(colored-man-pages colorize compleat git gitfast lein rust web-search zsh-syntax-highlighting)

### user configuration
# set the syntax highligters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

#load zsh config framework
source $ZSH/oh-my-zsh.sh

############################################################################
# aliases                                                                  #
############################################################################

# package manaagment

## arch install/sync with yas
alias yas='yaourt -S'

## arch remove with yar
alias yar='yaourt -R'

# file handlers:
alias edit=$EDITOR
alias play='mplayer -idx -fs'
alias show='feh --auto-zoom --fullscreen'

alias -s conf=edit
alias -s org=edit
alias -s tex=edit
alias -s txt=edit

alias -s avi=play
alias -s mpg=play
alias -s mp3=play
alias -s mp4=play
alias -s wmv=play

alias -s jpg=show
alias -s jpeg=show
alias -s JPG=show
alias -s JPEG=show
alias -s png=show
alias -s gif=show
alias -s GIF=show

# always 'ls' after any 'cd':
function chpwd() {
    emulate -LR zsh
    ls
}

# move and rename multiple files
autoload -U zmv
alias mmv='noglob zmv -W'
