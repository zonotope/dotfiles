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
        if [[ "$OSTYPE" == darwin* ]]; then
            mkdir -p $ADOTDIR
        else
            mkdir --parents $ADOTDIR
        fi
    fi

    curl --ssl --show-error --location git.io/antigen > $ANTIGEN
fi

## load antigen
source $ANTIGEN

############################################################################
# declare plugins                                                          #
############################################################################

## command suggestions based on history
antigen bundle zsh-users/zsh-autosuggestions

## jump back to parent directories
antigen bundle Tarrasch/zsh-bd

## clipboard copy/paste
antigen bundle twang817/zsh-clipboard

## shell command completion
antigen bundle zsh-users/zsh-completions

## colorize command output with grc
antigen bundle joshuarubin/zsh-grc

## set the terminal title
antigen bundle jreese/zsh-titles

## command line search engine interface
antigen bundle robbyrussell/oh-my-zsh plugins/web-search

### load these plugins last
## syntax highlighter
antigen bundle zsh-users/zsh-syntax-highlighting

## history search
antigen bundle zsh-users/zsh-history-substring-search

## set the prompt
antigen bundle zonotope/zsh-prompt


##### finalize and load plugins
antigen apply

############################################################################
# configure plugins                                                        #
############################################################################

## fetch autosuggestions asynchronously
ZSH_AUTOSUGGEST_USE_ASYNC=true

## set syntax highlighters
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

## bind history substring search to up/down arrows
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=(fg:yellow bg:black)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
