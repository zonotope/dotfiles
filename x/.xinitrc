#!/bin/sh
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

############################################################################
# xsession                                                                 #
############################################################################

xrdb -merge ~/.Xresources


############################################################################
# keymaps                                                                  #
############################################################################

# bind multimedia keys
xbindkeys

# swap caps with ctrl, and kill x with ctrl + alt + bksp
setxkbmap -option ctrl:swapcaps -option terminate:ctrl_alt_bksp


############################################################################
# background                                                               #
############################################################################
# feh --bg-scale pics/wallpapers/john_b_gordon_classroom.jpg


############################################################################
# start daemons                                                            #
############################################################################

## urxvt server process
urxvtd -q -f -o


############################################################################
# window manager                                                           #
############################################################################

exec stumpwm
