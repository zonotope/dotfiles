# enable completion colors, and use LS_COLORS for auto-completion.
zmodload -a colors
zmodload -a autocomplete
zmodload -a complist
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# case and hyphen insensitive search
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}'\
       'r:|=*' 'l:|=* r:|=*'

# cache completions
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR

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

# initialize and load the completion system
autoload -U compinit && compinit
