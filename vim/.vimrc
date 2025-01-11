call plug#begin()

Plug 'bling/vim-bufferline'
Plug 'puremourning/vimspector'

call plug#end()

" Settings

"habamax zaibatsu wildcharm retrobox
colorscheme retrobox

set wildignore=*/node_modules/*,*/build/*,*/dist/*,*/env/*
set path=**

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

let g:netrw_banner=0
let g:netrw_list_hide="node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
autocmd FileType c,cpp setlocal omnifunc=ccomplete#Complete

let g:vimspector_enable_mappings = 'HUMAN'

autocmd BufWritePre * %s/\s\+$//e

" Mappings

let g:mapleader=" "

nnoremap - <cmd>:Ex<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
nnoremap <leader><leader> <cmd>nohlsearch<cr>
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

nnoremap <leader>dr <cmd>VimspectorReset<cr>

function! SetBg(...)
    let l:color = get(a:, 1, "#000001")
    execute 'highlight Normal guibg=' . l:color
    execute 'highlight LineNr guibg=' . l:color
    execute 'highlight StatusLine guibg=' . l:color
    execute 'highlight SignColumn guibg=' . l:color
    execute 'highlight EndOfBuffer guibg=' . l:color
endfunction
command! -nargs=? SB call SetBg(<f-args>)

autocmd BufRead * call SetBg()
