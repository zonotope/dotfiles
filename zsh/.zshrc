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


## load shell options
source $ZSHD/options.zsh

## load aliases
source $ZSHD/aliases.zsh
