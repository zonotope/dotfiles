############################################################################
# initialize plugin system                                                 #
############################################################################

## set the antigen path
export ADOTDIR=$ZSHD/antigen/
export ANTIGEN=$ANTIGEN_PATH/antigen.zsh
typeset -a ANTIGEN_CHECK_FILES=($0:A)

## set the antigen path
export ANTIGEN_PATH=$ZSHD/antigen/
export ANTIGEN=$ANTIGEN_PATH/antigen.zsh

## install antigen if necessary
if [[ ! -a $ANTIGEN ]]; then
    echo "Installing Antigen...."

    if [[ ! -d $ANTIGEN_PATH ]]; then
       mkdir --parents $ANTIGEN_PATH
    fi

    curl --ssl --show-error --location git.io/antigen > $ANTIGEN
fi

## load antigen
source $ANTIGEN

############################################################################
# declare plugins                                                          #
############################################################################

## set the terminal title
antigen bundle jreese/zsh-titles

## jump back to parent directories
antigen bundle Tarrasch/zsh-bd

## clipboard copy/paste
antigen bundle twang817/zsh-clipboard

## shell command completion
antigen bundle zsh-users/zsh-completions

## colorize output
antigen bundle unixorn/warhol.plugin.zsh

## oh-my-zsh plugins
antigen bundle robbyrussell/oh-my-zsh plugins/colored-man-pages
antigen bundle robbyrussell/oh-my-zsh plugins/colorize
antigen bundle robbyrussell/oh-my-zsh plugins/compleat
antigen bundle robbyrussell/oh-my-zsh plugins/gitfast
antigen bundle robbyrussell/oh-my-zsh plugins/lein
antigen bundle robbyrussell/oh-my-zsh plugins/rust
antigen bundle robbyrussell/oh-my-zsh plugins/web-search

### load these plugins last

## set the prompt
antigen bundle zonotope/zsh-prompt

## syntax highlighter
antigen bundle zsh-users/zsh-syntax-highlighting

## history search
antigen bundle zsh-users/zsh-history-substring-search


##### finalize and load plugins
antigen apply


############################################################################
# configure plugins                                                        #
############################################################################

## set syntax highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

## bind history substring search to up/down arrows
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(fg:yellow bg:black)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
