############################################################################
# path                                                                     #
############################################################################

# base
export PATH=$PATH:/usr/local/bin

# my stuff
export PATH=$HOME/.bin:$PATH

# rust
export CARGO_HOME=$HOME/.cargo
export PATH=$PATH:$CARGO_HOME/bin

# go
export GOROOT=/user/lib/go
export GOPATH=$HOME/.go
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# rbenv
export PATH=$PATH:$HOME/.rbenv/shims
eval "$(rbenv init -)"

############################################################################
# editor                                                                   #
############################################################################

# use emacsclient
export EDITOR="emacsclient --create-frame --no-wait"

# allows emacsclient to start a daemon if one isn't already running
export ALTERNATE_EDITOR=""

############################################################################
# startup                                                                  #
############################################################################

# start the x server if we're on linux and it isn't started already
if [ "$(uname)" = "Linux" ] && [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]
then
  exec startx
fi

# xterm cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

# print a fortune on log in:
echo
fortune
echo
