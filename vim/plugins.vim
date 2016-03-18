" https://github.com/junegunn/vim-plug
" :PlugInstall to install plugins.

call plug#begin('~/.vim/plugged')

Plug 'rking/ag.vim'
  " Search in project (nearest .git) directory
  let g:ag_working_path_mode="r"

Plug 'derekelkins/agda-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
  let g:airline#extensions#tabline#enabled = 2
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline#extensions#tabline#right_sep = ' '
  let g:airline#extensions#tabline#right_alt_sep = '|'
  let g:airline_left_sep = ' '
  let g:airline_left_alt_sep = '|'
  let g:airline_right_sep = ' '
  let g:airline_right_alt_sep = '|'
  let g:airline_theme= 'zenburn'

Plug 'ctrlpvim/ctrlp.vim'
  let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(class|so)',
    \ }
  " Use the nearest .git directory as the cwd
  let g:ctrlp_working_path_mode = 'r'
  " Open file menu
  let g:ctrlp_map = '<Leader>pf'
  " Open buffers
  nnoremap <Leader>pb :CtrlPBuffer<CR>
  " Open most recently used files
  nnoremap <Leader>pr :CtrlPMRUFiles<CR>

Plug 'Raimondi/delimitMate'

Plug 'idris-hackers/idris-vim'
  let g:idris_conceal=1 " Concealing with unicode characters

Plug 'scrooloose/nerdtree'
  nmap <silent> <F2> :NERDTreeToggle<CR>

Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/syntastic'
  " Use location list for errors
  let g:syntastic_always_populate_loc_list = 1
  " Do not oupen location list window
  let g:syntastic_auto_loc_list = 0
  let g:syntastic_check_on_open = 1
  let g:syntastic_check_on_wq = 0

  " Filetypes not checked on open
  au FileType scala let b:syntastic_mode = "passive"

  " Check file
  nnoremap <Leader>ee :SyntasticCheck<CR>

  " Open/Close location list window
  nnoremap <Leader>eo :lopen<CR>
  nnoremap <Leader>ec :lclose<CR>

  " Jump between errors
  nnoremap <Leader>gn :lnext<CR>
  nnoremap <Leader>gp :lprev<CR>
  nnoremap <Leader>gf :lfirst<CR>
  nnoremap <Leader>gl :llast<CR>

Plug 'jeetsukumaran/vim-buffergator'

Plug 'terryma/vim-expand-region'

Plug 'LnL7/vim-nix'

Plug 'derekwyatt/vim-scala'

Plug 'tpope/vim-sensible'

Plug 'tpope/vim-surround'

Plug 'jnurmine/Zenburn'

call plug#end()

colorscheme zenburn
