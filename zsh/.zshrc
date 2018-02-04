source $ZSHD/options.zsh

source $ZSHD/plugins.zsh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(fg:yellow bg:black)
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down



source $ZSHD/aliases.zsh
