############################################################################
# path                                                                     #
############################################################################

## base
export PATH=/usr/local/bin:$PATH

## go
export GOROOT=/usr/lib/go
export PATH=$GOROOT/bin:$PATH

export GOPATH=$HOME/code/go
export PATH=$GOPATH/bin:$PATH

## ruby (rbenv)
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

export GEM_HOME=$HOME/.gem
export PATH=$(ruby -e 'print Gem.user_dir')/bin:$PATH

## rust
export CARGO_HOME=$HOME/.cargo
export PATH=$CARGO_HOME/bin:$PATH

## common lisp
export SBCL_HOME=/usr/lib/sbcl/

## custom scripts
export BINPATH=$HOME/.bin
if [[ -d $BINPATH ]]
then
    export PATH=$BINPATH:$PATH
fi
