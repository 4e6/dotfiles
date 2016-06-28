#if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
if [[ -z $DISPLAY ]] && [[ $XDG_VTNR -eq 1 ]]; then
  #exec nohup startx > /dev/null & vlock
  exec startx
fi
