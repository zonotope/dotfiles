## locale (american english)
export LANG=en_US.UTF-8

## arch compilation flags
export ARCHFLAGS="-arch x86_64"

## editor
export EDITOR="emacsclient --create-frame --no-wait"
export ALTERNATE_EDITOR="" # allows emacsclient to start a daemon if one isn't
                           # already running

## browser
if [ -n "$DISPLAY" ]; then
    export BROWSER="firefox"
else
    export BROWSER="w3m"
fi

## pager
export PAGER="less"
export LESS="--RAW-CONTROL-CHARS --squeeze-blank-lines --quit-if-one-screen --ignore-case"

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

## rbenv
export PATH=$PATH:$HOME/.rbenv/shims
eval "$(rbenv init -)"

## rust
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin
