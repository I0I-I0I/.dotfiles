call plug#begin()

Plug 'pacha/vem-tabline'

call plug#end()

" Settings

"habamax zaibatsu wildcharm retrobox
colorscheme retrobox

set wildignore=*/node_modules/*,*/build/*,*/dist/*,*/env/*
set path=**

set nocompatible
set termguicolors
set undofile
set noswapfile nobackup nowritebackup
set smartindent expandtab shiftwidth=4 tabstop=4
set completeopt=menu,menuone,fuzzy,noinsert,popup
set linebreak
set smartcase incsearch hlsearch
set mouse=a
set rnu nu
set updatetime=300
set signcolumn=yes
set laststatus=0
set hidden
set cursorline

let g:netrw_banner=0
let g:netrw_list_hide="node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
autocmd FileType c,cpp setlocal omnifunc=ccomplete#Complete

let g:vem_tabline_show = 2

autocmd BufWritePre * %s/\s\+$//e

" Mappings

let g:mapleader=" "

nnoremap - <cmd>:Ex<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
vnoremap <silent> K :m '<-2<cr>gv=gv
vnoremap <silent> J :m '>+1<cr>gv=gv
nnoremap <C-l> <cmd>bn<cr>
nnoremap <C-h> <cmd>bp<cr>
nnoremap <C-q> <cmd>bd<cr>
nnoremap <C-n> <cmd>cnext<cr>zz
nnoremap <C-p> <cmd>cprevious<cr>zz
xnoremap P "0P
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <leader><C-t> <cmd>!tmux neww tmux-sessionizer<cr>
nnoremap <leader>t <cmd>execute '!tmux neww tmux-run ' . input("Run: ")<cr>

autocmd VimEnter * packadd termdebug
