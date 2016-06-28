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

# settings
setxkbmap -layout us,ru -variant ,phonetic -option grp:shift_toggle,grp_led:scroll
xset r rate 200 30
xset -dpms
xset s off
xset -b # disable beep
[ -f .Xresources ] && xrdb -merge .Xresources
[ -f .xmod ] && xmodmap .xmod

# daemons
xbindkeys
urxvtd -q -o -f

exec i3
