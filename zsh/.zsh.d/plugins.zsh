############################################################################
# initialize plugin system                                                 #
############################################################################

## set the antigen path
export ADOTDIR=$ZSHD/antigen/
export ANTIGEN=$ADOTDIR/antigen.zsh
typeset -a ANTIGEN_CHECK_FILES=($0:A)

## install antigen if necessary
if [[ ! -a $ANTIGEN ]]; then
    echo "Installing Antigen...."

    if [[ ! -d $ADOTDIR ]]; then
        mkdir -p $ADOTDIR
    fi

    curl --ssl --show-error --location https://git.io/antigen > $ANTIGEN
fi

## load antigen
source $ANTIGEN

############################################################################
# declare plugins                                                          #
############################################################################

## command suggestions based on history
antigen bundle zsh-users/zsh-autosuggestions

## clipboard copy/paste
antigen bundle twang817/zsh-clipboard

## extra shell command completion
antigen bundle zsh-users/zsh-completions

## colorize command output with grc
antigen bundle joshuarubin/zsh-grc

## set the terminal title
antigen bundle jreese/zsh-titles

## command line search engine interface
antigen bundle robbyrussell/oh-my-zsh plugins/web-search


#### these plugins need to load last

## syntax highlighter
antigen bundle zsh-users/zsh-syntax-highlighting

## set the prompt
antigen bundle zonotope/zsh-prompt

## history search
antigen bundle zsh-users/zsh-history-substring-search

############################################################################
# install and load plugins                                                 #
############################################################################

antigen apply

############################################################################
# configure plugins                                                        #
############################################################################

ZSH_AUTOSUGGEST_USE_ASYNC=true # fetch autosuggestions asynchronously

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets) # set syntax highlighters

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(fg:yellow) # color matches yellow
bindkey '^[[A' history-substring-search-up # up arrow key for search up
bindkey '^[[B' history-substring-search-down # down arrow key for search down
