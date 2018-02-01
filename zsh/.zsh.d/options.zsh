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
