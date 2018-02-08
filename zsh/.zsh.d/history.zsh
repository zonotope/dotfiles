## history file
export HISTFILE=$HOME/.zhistory

## save the last 10000 commands
export HISTSIZE=10000
export SAVEHIST=10000

## don't overwrite the history file; add to the end instead
setopt APPEND_HISTORY

## don't wait until exiting; add to the history file as commands execute
setopt INC_APPEND_HISTORY

## save command timing
setopt EXTENDED_HISTORY

## use the same history file between shells
setopt SHARE_HISTORY

## confirm command "!" search results before executing them
setopt HIST_VERIFY

## ignore any duplicate history entries
setopt HIST_IGNORE_DUPS

## trim whitespace before writing to history
setopt HIST_REDUCE_BLANKS

## don't store history related commands in history
setopt HIST_NO_STORE

## don't store commands that start with a space
setopt HIST_IGNORE_SPACE
