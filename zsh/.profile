############################################################################
# path                                                                     #
############################################################################

## base
export PATH=/usr/local/bin:$PATH

## custom scripts
export BINPATH=$HOME/.bin
if [[ -d $BINPATH ]]
then
    export PATH=$BINPATH:$PATH
fi

## common lisp
export SBCL_HOME=/usr/lib/sbcl/

## go
export GOROOT=/usr/lib/go
export PATH=$GOROOT/bin:$PATH

export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH

## npm/node.js
export PATH=$HOME/.node_modules/bin:$PATH
export npm_config_prefix=~/.node_modules

## ruby (rbenv)
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

export GEM_HOME=$HOME/.gem
export PATH=$(ruby -e 'print Gem.user_dir')/bin:$PATH

## rust
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH
