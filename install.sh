#!/usr/bin/env bash

script_name="$(basename "$0")"
source_dir=$1
dest_dir=$HOME/dotfiles_test
backup_dir=$HOME/dotfiles_old

FILES=( zshrc vimrc gitconfig gitignore )
VIM_PLUGINS=(
  https://github.com/ctrlpvim/ctrlp.vim
  https://github.com/idris-hackers/idris-vim.git
  https://github.com/scrooloose/nerdtree.git
  https://github.com/scrooloose/syntastic.git
  https://github.com/Twinside/vim-haskellConceal.git
  https://github.com/japesinator/vim-IdrisConceal.git
  https://github.com/derekwyatt/vim-scala.git
  https://github.com/tpope/vim-sensible.git
  https://github.com/jnurmine/Zenburn.git
)

command_exists () {
  if hash $1 &>/dev/null; then
    echo "OK $(command -v $1)"
  else
    echo "!! $1 not found"
  fi
}

usage () {
  echo `command_exists rsync`
  echo "usage $script_name source [destination]"
  exit 1
}

install_pathogen () {
  echo "installing pathogen"
  mkdir -p ~/.vim/autoload ~/.vim/bundle && curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

  for plugin in ${VIM_PLUGINS[@]}
  do
    cd ~/.vim/bundle && git clone $plugin
  done
}

[ -z $source ] && usage
