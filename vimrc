" vim-plug (https://github.com/junegunn/vim-plug) settings 
" Automatically install vim-plug and run PlugInstall if vim-plug not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call plug#end()


set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set cursorline
let mapleader="\<space>"
inoremap jk <esc>
nnoremap <leader>ez :vsp ~/.zshrc<CR>
nnoremap <leader>en :vsp 
" tab stuff
 set tabstop=2
 set softtabstop=2
 set expandtab
 set smarttab
 set shiftwidth=2
 set autoindent
 set smartindent
 

