############################################################################
# path                                                                     #
############################################################################

## base
export PATH=$PATH:/usr/local/bin

## custom scripts
export PATH=$HOME/.bin:$PATH

## go
export GOROOT=/user/lib/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

## rbenv
export PATH=$PATH:$HOME/.rbenv/shims
eval "$(rbenv init -)"

## rust
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin

############################################################################
# default apps                                                             #
############################################################################

## editor
export EDITOR="emacsclient --create-frame --no-wait"
export ALTERNATE_EDITOR="" # allows emacsclient to start a daemon if one isn't
                           # already running

## browser
if [ -n "$DISPLAY" ]; then
    export BROWSER="chromium"
else
    export BROWSER="w3m"
fi

############################################################################
# startup                                                                  #
############################################################################

# start the x server if we're on linux and it isn't started already
if [ "$(uname)" = "Linux" ] && [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi

# xterm cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

# print a fortune on log in:
echo
fortune
echo
