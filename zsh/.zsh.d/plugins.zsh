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
    echo "------ Installing Antigen... ------"

    if [[ ! -d $ANTIGEN_PATH ]]; then
       mkdir --parents $ANTIGEN_PATH
    fi

    curl --ssl --show-error --location git.io/antigen > $ANTIGEN
fi

## load antigen
source $ANTIGEN

############################################################################
# plugins                                                                  #
############################################################################

# set the terminal title
antigen bundle jreese/zsh-titles

# jump back to parent directories
antigen bundle Tarrasch/zsh-bd

# add clipboard copy/paste
antigen bundle twang817/zsh-clipboard

# shell command completion
antigen bundle zsh-users/zsh-completions

# oh-my-zsh libraries
antigen bundle robbyrussell/oh-my-zsh lib/functions
antigen bundle robbyrussell/oh-my-zsh lib/spectrum
antigen bundle robbyrussell/oh-my-zsh lib/termsupport

# oh-my-zsh plugins
antigen bundle robbyrussell/oh-my-zsh plugins/colored-man-pages
antigen bundle robbyrussell/oh-my-zsh plugins/colorize
antigen bundle robbyrussell/oh-my-zsh plugins/compleat
antigen bundle robbyrussell/oh-my-zsh plugins/gitfast
antigen bundle robbyrussell/oh-my-zsh plugins/lein
antigen bundle robbyrussell/oh-my-zsh plugins/rust
antigen bundle robbyrussell/oh-my-zsh plugins/web-search

# load these last
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search


antigen apply
