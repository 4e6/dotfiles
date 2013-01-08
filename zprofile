if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec nohup startx > /dev/null & vlock
  # Could use xinit instead of startx
  #exec xinit -- /usr/bin/X -nolisten tcp vt7
fi

eval $(keychain --eval --agents ssh -Q --quiet id_rsa)
