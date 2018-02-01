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

# user configuration

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
# history                                                                  #
############################################################################

## confirm command "!" search results before executing them
setopt HIST_VERIFY

## add to the history file as commands execute
setopt INC_APPEND_HISTORY

## use the same history file between shells
setopt SHARE_HISTORY

## save command timing
setopt EXTENDED_HISTORY

## shoe each command only once in history searches
setopt HIST_FIND_NO_DUPS

## trim whitespace before writing to history
setopt HIST_REDUCE_BLANKS

## don't store history related commands in history
setopt HIST_NO_STORE

## don't store function definitions in history
setopt HIST_NO_FUNCTIONS

## don't store commands that start with a space
setopt HIST_IGNORE_SPACE

############################################################################
# aliases                                                                  #
############################################################################

## history (timestamped yyyy-mm-dd)
alias history='fc -il 1'

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
