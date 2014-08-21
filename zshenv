typeset -U path
path=(~/bin $(ruby -rubygems -e "puts Gem.user_dir")/bin $path)

export TERMINAL=urxvtc
export EDITOR=vim
export BROWSER=chromium
export FILE_MANAGER_APP='urxvtc -e ranger'
export VIDEO_APP='urxvtc -e mplayer'

systemctl --user import-environment PATH
