############################################################################
# history                                                                  #
############################################################################

## don't overwrite the history file
setopt APPEND_HISTORY

## add to the history file as commands execute
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

## don't store function definitions in history
setopt HIST_NO_FUNCTIONS

## don't store commands that start with a space
setopt HIST_IGNORE_SPACE

############################################################################
# colors                                                                   #
############################################################################

# Use LS_COLORS for autocompletion
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
