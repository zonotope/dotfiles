#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xrdb -merge ~/.Xresources
# xmodmap ~/.xmodmap &
xkbcomp ~/.Xkeymap $DISPLAY &
xbindkeys
feh --bg-scale pics/wallpapers/john_b_gordon_classroom.jpg
exec stumpwm
