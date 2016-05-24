for file in ~/.zshenv.d/*(N); do
  source "$file"
done

export TERMINAL=urxvtc
export EDITOR=nvim
export VISUAL=nvim
export BROWSER=chromium
export FILE_MANAGER_APP='urxvtc -e ranger'
export VIDEO_APP='urxvtc -e mplayer'
