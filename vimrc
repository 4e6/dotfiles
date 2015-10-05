silent! execute pathogen#infect()

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
set backspace=indent,eol,start " Allow backspacing over everything in insert mode.
set scrolloff=5 " Show 5 lines above/below the cursor when scrolling.
set showcmd " Shows the command in the last line of the screen.
set autoread " Read files when they've been changed outside of Vim.
au CursorHold * checktime " When 'CursorHold' every 4 seconds check file change
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

" Colorscheme
syntax enable
colorscheme zenburn

" Copy-paste
vmap <C-w> "+y
nmap <C-y> "+p
vmap <C-y> "+p
imap <C-y> <ESC><C-y>i

" NerdTree Mapping
nmap <silent> <F2> :NERDTreeToggle<CR>

" ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(class|so)',
  \ }

" idris-vim
let g:idris_conceal=1 " Concealing with unicode characters
