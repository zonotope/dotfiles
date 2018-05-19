############################################################################
# path                                                                     #
############################################################################

## base
export PATH=$PATH:/usr/local/bin

## custom scripts
export PATH=$HOME/.bin:$PATH

## go
export GOROOT=/usr/lib/go
export GOPATH=$HOME/.go
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

############################################################################
# startup                                                                  #
############################################################################

## start the x server if we're on linux and it isn't started already
if [ "$(uname)" = "Linux" ] && [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]
then
  exec startx
fi

## term cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

## print a fortune on log in:
echo
fortune
echo
