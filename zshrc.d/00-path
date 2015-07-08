# path configuration, see
# https://wiki.archlinux.org/index.php/Zsh#Configuration_files

typeset -U path
path=(
  ~/bin
  ~/.local/bin
  ~/.cabal/bin
  $(ruby -rubygems -e "puts Gem.user_dir")/bin
  $path
)
