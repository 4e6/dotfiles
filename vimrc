" Use 256 colors
set t_Co=256

" Incompatibility with vi
set nocompatible

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Various
set number " Show line numbers
set title " Set window title
set list " Display invisible chars
set ruler " Display row/column info
set scrolloff=5 " Show 5 lines above/below the cursor when scrolling.
set showcmd " Shows the command in the last line of the screen.
set visualbell " Disable beeps

" Highlight search results
set hlsearch " Highlight search terms
set incsearch " Show search matches as you type
set ignorecase " Ignore case when searching
set smartcase " Make searches case sensitive only if they contain uppercase stuff

" Indent/tab options
set expandtab " Use spaces for tabs.
set shiftwidth=2 " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set smarttab

" Indent as many times as you want in visual mode without losing focus
vnoremap < <gv
vnoremap > >gv

" Copy and paste from system clipboard
vmap <Leader>yy "+y
vmap <Leader>yd "+d
nmap <Leader>yp "+p
nmap <Leader>yP "+P
vmap <Leader>yp "+p
vmap <Leader>yP "+P

source ~/.vim/plugins.vim
