# Start X at login
if status is-interactive
  if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
    exec startx -- -keeptty
  end
end

# Base16 Shell
# run `base16-zenburn` shell command once to set the colors
#if status --is-interactive
    #set BASE16_SHELL "$HOME/.config/base16-shell/"
    #source "$BASE16_SHELL/profile_helper.fish"
#end

# disable greeting
set -U fish_greeting
