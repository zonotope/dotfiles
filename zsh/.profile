############################################################################
# path                                                                     #
############################################################################

## base
export PATH=$PATH:/usr/local/bin

## custom scripts
export PATH=$HOME/.bin:$PATH

## go
export GOROOT=/usr/lib/go
export GOPATH=$HOME/code/go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

## ruby (rbenv)
export PATH=$HOME/.rbenv/shims:$PATH
eval "$(rbenv init -)"

export GEM_HOME=$HOME/.gem
export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin

## rust
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin
