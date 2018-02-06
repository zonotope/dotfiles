############################################################################
# shell                                                                    #
############################################################################

## enable the bell
setopt BEEP

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
# completion                                                               #
############################################################################

# Use LS_COLORS for autocompletion colors
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# move the cursor to the end of the word when a completion is inserted
setopt ALWAYS_TO_END

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

# expand aliases before trying to complete them
setopt COMPLETE_ALIASES

# don't assume cursor is at the end of a word when searching for completions
setopt COMPLETE_IN_WORD

# only pop up the menu if the search is ambiguous. just use the match otherwise
setopt LIST_AMBIGUOUS

# beep on an ambiguous completion
setopt LIST_BEEP

# display the menu efficiently
setopt LIST_PACKED

# select completion candidates from a menu
setopt auto_menu
zstyle ':completion:*' menu select
