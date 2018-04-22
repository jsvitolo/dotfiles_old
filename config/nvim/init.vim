" Set standard file encoding
"
set encoding=utf8
" No special per file vim override configs
set nomodeline
" Stop word wrapping
set nowrap
" Except... on Markdown. That's good stuff.
  autocmd FileType markdown setlocal wrap
" Adjust system undo levels
set undolevels=100
" Use system clipboard
set clipboard=unnamed

" Set tab width and convert tabs to spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Don't let Vim hide characters or make loud dings
" set conceallevel=1
set noerrorbells
" Number gutter
set number
" Use search highlighting
set hlsearch
" Space above/beside cursor from screen edges
set scrolloff=1
set sidescrolloff=5

" Remapping <Leader> to <Space>
let mapleader="\<SPACE>"

" Disable mouse support
" set mouse=r
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Setting Arrow Keys to Rezize Panes
nnoremap <Left> :vertical resize -1<CR>
nnoremap <Right> :vertical resize +1<CR>
nnoremap <Up> :resize -1<CR>
nnoremap <Down> :resize +1<CR>

" Disable arrow keys completely in Insert Mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Return with Buffers /Tabs
nmap <Leader><Leader> <c-^>

" Next / Previous Buffeer (Tab)
nnoremap <Tab> :bnext!<CR>
nnoremap <S-TAB> :bprev!<CR><Paste>

" Intentation guides
let g:indentLine_enabled = 1
let g:indentLine_char = "⟩"

" Tab & a Status Bar
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
set laststatus=2

" Fuzzy Finder
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>t :CtrlP<CR>

" Find in Files
nnoremap <Leader>fp :Grepper<Space>-query<Space>
nnoremap <Leader>fb :Grepper<Space>-buffers<Space>-query<Space>-<Space>

" Project as File Tree
map ` :VimFiler -explorer<CR>
map ~ :VimFilerCurrentDir -explorer -find<CR>

" Sneaking Efficient Moving
let g:sneak#s_next = 1
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

" Plugin Manager
call plug#begin('~/.local/share/nvim/plugged')

" PLUGINS GO HERE!!!
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
Plug 'Shougo/vimfiler.vim', { 'on': 'VimFiler' }
Plug 'w0rp/ale'
Plug 'justinmk/vim-sneak'
Plug 'mhinz/vim-grepper'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'Shougo/unite.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Yggdroot/indentLine'
Plug 'vim-ruby/vim-ruby'
Plug 'whatyouhide/vim-gotham'

" Elixir Support 
Plug 'elixir-lang/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'mmorearty/elixir-ctags'
Plug 'mattreduce/vim-mix'
Plug 'BjRo/vim-extest'
Plug 'frost/vim-eh-docs'
Plug 'slashmili/alchemist.vim'
Plug 'tpope/vim-endwise'
Plug 'jadercorrea/elixir_generator.vim'
call plug#end()

" Enable highlighting of the current line
set cursorline

let g:airline_theme='violet' 
" Theme and Styling 
colorscheme dracula
