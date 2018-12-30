## install antigen and load plugins
source $ZSHD/plugins.zsh

############################################################################
# shell options                                                            #
############################################################################

## enable the bell
setopt BEEP

## enable comments in interactive shells
setopt INTERACTIVE_COMMENTS

## disable flow control so "C-s" doesn't disable shell output!
unsetopt FLOW_CONTROL

############################################################################
# directories                                                              #
############################################################################

# save the last 8 visited directories
export DIRSTACKSIZE=8

# auto change to a directory with just the name
setopt AUTO_CD

# push the previous directory onto the stack after every cd
setopt AUTO_PUSHD

# powerful glob pattern replacing and completion
setopt EXTENDED_GLOB

# write to multiple files at once
setopt MULTIOS

# don't push any dupes onto the directory stack
setopt PUSHD_IGNORE_DUPS

# don't print stack modifications
setopt PUSHD_SILENT

# push home when pushd is called without arguments
setopt PUSHD_TO_HOME

# case insensitive glob/matching
unsetopt CASE_GLOB

# don't overwrite existing files with  > and >>. require >! and >>! instead.
unsetopt CLOBBER

############################################################################
# history                                                                  #
############################################################################

## history file
export HISTFILE=$HOME/.zhistory

## save the last 10000 commands
export HISTSIZE=10000
export SAVEHIST=10000

## don't overwrite the history file; add to the end instead
setopt APPEND_HISTORY

## save command timing
setopt EXTENDED_HISTORY

## ignore any duplicate history entries
setopt HIST_IGNORE_DUPS

## don't store commands that start with a space
setopt HIST_IGNORE_SPACE

## don't store history related commands in history
setopt HIST_NO_STORE

## trim whitespace before writing to history
setopt HIST_REDUCE_BLANKS

## confirm command "!" search results before executing them
setopt HIST_VERIFY

## don't wait until exiting; add to the history file as commands execute
setopt INC_APPEND_HISTORY

## use the same history file between shells
setopt SHARE_HISTORY

############################################################################
# completions                                                              #
############################################################################

# move the cursor to the end of the word when a completion is inserted
setopt ALWAYS_TO_END

# automatically list choices on ambiguous completion.
setopt AUTO_LIST

# pop up the menu after the second completion request
setopt AUTO_MENU

# reconcile absolute paths and those relative to '~'.
setopt AUTO_NAME_DIRS

# automatically trim spaces from completions when necessary
setopt AUTO_PARAM_KEYS

# add trailing slashes to directory completions when necessary
setopt AUTO_PARAM_SLASH

# and remove slashes when necessary too.
setopt AUTO_REMOVE_SLASH

# don't assume cursor is at the end of a word when searching for completions
setopt COMPLETE_IN_WORD

# only pop up the menu if the search is ambiguous. just use the match otherwise
setopt LIST_AMBIGUOUS

# beep on an ambiguous completion
setopt LIST_BEEP

# display the menu efficiently
setopt LIST_PACKED

# search path for command names with slashes in them corresponding to subdirs
setopt PATH_DIRS

# enable colored completion list module
zmodload -a complist

# use LS_COLORS for the completion list colors
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# case and hyphen insensitive search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'\
       'r:|=*' 'l:|=* r:|=*'

# completion cache
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

# select completions from an arrow driven menu
zstyle ':completion:*' menu select

# load completion system
autoload -Uz compinit && compinit

############################################################################
# aliases                                                                  #
############################################################################

## grep: colorize, and skip git dirs
alias grep='grep --color=auto --exclude-dir=.git'

## ls: colorize
if [[ "$OSTYPE" == darwin* ]]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi

## repeat the last command with sudo
alias please='sudo $(fc -ln -1)'

## history (timestamped yyyy-mm-dd)
alias history='fc -il 1'

## move and rename multiple files
autoload -U zmv
alias mmv='noglob zmv -W'

## text
alias edit=$EDITOR
alias -s conf=edit
alias -s md=edit
alias -s org=edit
alias -s tex=edit
alias -s txt=edit

## audio/video
alias play='mplayer -idx -fs'
alias -s avi=play
alias -s mkv=play
alias -s mpg=play
alias -s mp3=play
alias -s mp4=play
alias -s wmv=play

## images
alias show='feh --auto-zoom'
alias -s jpg=show
alias -s jpeg=show
alias -s png=show
alias -s gif=show

## always 'ls' after any 'cd':
function chpwd {
    emulate -LR zsh
    ls
}

## name the current directory
function namedir {
    eval $1=$PWD
    : $1
}
