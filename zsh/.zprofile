############################################################################
# path                                                                     #
############################################################################

# base
export PATH=/usr/local/bin:$PATH

# my stuff
export PATH=$HOME/.bin:$PATH

# go
export GOROOT=/user/lib/go
export GOPATH=$HOME/.go

export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:$GOPATH/bin

# rbenv
export PATH=$HOME/.rbenv/shims:$PATH
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

# start the x server if it isn't started already
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi

# xterm cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

# print a fortune on log in:
echo
fortune -a
echo
