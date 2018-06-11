## set the path from .profile

source $HOME/.profile

############################################################################
# startup                                                                  #
############################################################################

## term cursor: blinking underscore
echo -e -n "\x1b[\x33 q"

## print a fortune on log in:
echo
fortune
echo
