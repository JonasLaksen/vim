" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'flazz/vim-colorschemes'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jiangmiao/auto-pairs'
call vundle#end()            " required

execute pathogen#infect()
nnoremap <C-l> :e#<CR> 
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
set nocompatible
set relativenumber
set cursorline
inoremap jk <Esc>
syntax on
filetype plugin indent on
set nu
let g:jsx_ext_required = 0
autocmd FileType javascript.jsx,javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ --trailing-comma\ es5
autocmd BufWritePre *.js exe "normal! gggqG\<C-o>\<C-o>"
autocmd FileType python nnoremap <buffer> <CR> :w !python<cr>
set expandtab
set shiftwidth=2
set softtabstop=2

if has('gui_running')
  set fu
  set guioptions-=r
  set guioptions-=L
  set guifont=Monaco:h14
  autocmd vimenter * NERDTree
  let g:NERDTreeWinPos = "right"
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd VimEnter * wincmd p
  colorscheme solarized
  set background=light
endif

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
