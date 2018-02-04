## load shell options
source $ZSHD/options.zsh

## load plugins
source $ZSHD/plugins.zsh

## configure plugins

# pick syntax highliters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# history search key bindings
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

## load the theme
source $ZSHD/zonotope-theme.zsh

## load aliases
source $ZSHD/aliases.zsh
