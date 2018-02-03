## load shell options
source $ZSHD/options.zsh

## load libs
for config_file ($ZSHD/lib/*.zsh); do
    source $config_file
done

## load plugins
source $ZSHD/plugins.zsh

## configure plugins
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

## load the theme
source $ZSHD/zonotope-theme.zsh

## load aliases
source $ZSHD/aliases.zsh
