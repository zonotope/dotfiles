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
xkbcomp ~/.Xkeymap $DISPLAY &
xbindkeys
compton -cCb --config ~/.config/compton.conf
feh --bg-scale pics/wallpapers/mekong.JPG
conky &
tint2 &
exec openbox
# exec i3
