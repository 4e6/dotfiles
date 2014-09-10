silent! execute pathogen#infect()

" NerdTree Mapping
nmap <silent> <F2> :NERDTreeToggle<CR>

" Use 256 colors
set t_Co=256

" Incompatibility with vi
set nocompatible

" Set syntax highlightning
syntax on
filetype plugin indent on

" Various
set nu " Show line numbers
set title " Set window title
set list " Display invisible chars
set ruler " Display row/column info
set bs=2 " Backspace, this is the same as :set backspace=indent,eol,start.
set scrolloff=5 " Show 5 lines above/below the cursor when scrolling.
set showcmd " Shows the command in the last line of the screen.
set autoread " Read files when they've been changed outside of Vim.
set visualbell " Disable beeps

" Highlight search results
set hlsearch " Highlight search terms
set incsearch " Show search matches as you type
set ignorecase " Ignore case when searching
set smartcase " Make searches case sensitive only if they contain uppercase stuff

" Indent/tab options
set expandtab " Use spaces for tabs.
set ts=2 " Number of spaces to use for tabs.
set shiftwidth=2 " Number of spaces to autoindent.
set softtabstop=2 " Number of spaces for a tab.
set smarttab
" Indent as many times as you want in visual mode without losing focus
vnoremap < <gv
vnoremap > >gv
" Make a curly brace automatically insert an indented line
inoremap {<CR> {<CR>}<Esc>O<BS><Tab>

" Colorscheme
syntax enable
colorscheme zenburn

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Copy-paste
vmap <C-w> "+y
nmap <C-y> "+p
vmap <C-y> "+p
imap <C-y> <ESC><C-y>i

" vim-latex
set grepprg=grep\ -nH\ $*
let g:tex_flavor="latex"
