" General
let mapleader="\<SPACE>" " Map the leader key to SPC.
set hidden               " This allows buffers to be hidden if you've modified a buffer.
set undofile             " Keep undo history between sessions
set undodir=~/.local/share/nvim/undo

" Search
set hlsearch             " Highlight search results.
set ignorecase           " Make searching case insensitive
set smartcase            " ... unless the query contain uppercase letters.
set incsearch            " Incremental search.

" Formatting
set list                 " Display invisible chars
set showcmd              " Show (partial) command in status line.
set showmatch            " Show matching brackets.
set showmode             " Show current mode.
set ruler                " Show the line and column numbers of the cursor.
set number               " Show the line numbers on the left side.

set smarttab
set textwidth=0          " Hard-wrap long lines as you type them.
set tabstop=2            " Render TABs using this many spaces.
set shiftwidth=2         " Indentation amount for < and > commands.

set modeline             " Check beginning and end of file for modelines.
set nojoinspaces         " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow           " Horizontal split below current.
set splitright           " Vertical split to right of current.

set scrolloff=3          " Show next 3 lines while scrolling.
set nostartofline        " Do not jump to first character with page commands.

" Diff options
set diffopt+=iwhite      " Ignore changes in amount of white space.

" Keybindings

" Map ; to :
nnoremap ; :
" Save file
nnoremap <leader>w :w<CR>
" Copy and paste from system clipboard
vmap <leader>yy "+y
vmap <leader>yd "+d
nmap <leader>yp "+p
nmap <leader>yP "+P
vmap <leader>yp "+p
vmap <leader>yP "+P
" Indent as many times as you want in visual mode without losing focus
vnoremap < <gv
vnoremap > >gv

" Close current buffer without closing a window
nmap <leader>bq :bp <BAR> bd #<CR>

" Remove trailing spaces before saving text files
" http://vim.wikia.com/wiki/Remove_trailing_spaces
autocmd BufWritePre * :call StripTrailingWhitespace()
function! StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    if &filetype == 'mail'
      " Preserve space after e-mail signature separator
      %s/\(^--\)\@<!\s\+$//e
    else
      %s/\s\+$//e
    endif
    normal 'yz<Enter>
    normal `z
  endif
endfunction

" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

source ~/.vim/plugins.vim
