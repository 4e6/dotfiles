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

xbindkeys
urxvtd -q -o -f

setxkbmap -layout us,ru -variant ,phonetic -option grp:shift_toggle,grp_led:scroll
xset r rate 190 30
xset -dpms
xset s off
[[ -f .Xresources ]] && xrdb -merge .Xresources
[[ -f .xmod ]] && xmodmap .xmod

exec i3
