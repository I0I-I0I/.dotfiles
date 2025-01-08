call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'Shougo/unite.vim'
Plug 'mhartington/oceanic-next'

call plug#end()

" Settings

colorscheme OceanicNext

set wildignore+=*/node_modules/*
set wildignore+=*/build/*
set wildignore+=*/dist/*
set wildignore+=*/env/*
set path+=**

let g:netrw_banner=0
let g:netrw_list_hide="node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"
set termguicolors
set undofile
set noswapfile
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set completeopt=menu,menuone,fuzzy,noinsert,popup
set linebreak
set smartcase
set mouse=a
set incsearch
set rnu
set nu
set updatetime=300
set signcolumn=yes
syntax on

function! SetBg(color)
    execute 'highlight Normal guibg=' . a:color
    execute 'highlight LineNr guibg=' . a:color
    execute 'highlight StatusLine guibg=' . a:color
    execute 'highlight SignColumn guibg=' . a:color
    execute 'highlight EndOfBuffer guibg=' . a:color
endfunction

call SetBg('#1c1c1c')

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
nnoremap ]q <cmd>cnext<cr>
nnoremap [q <cmd>cprevious<cr>
xnoremap P "0P
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap <C-t> <cmd>!tmux neww tmux-sessionizer<cr>
nnoremap <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <leader>t <cmd>execute '!tmux neww tmux-run ' . input("Run: ")<cr>

nnoremap <C-p> <cmd>Unite file_rec<cr>
nnoremap <C-b> <cmd>Unite buffer<cr>

" Coc

inoremap <silent><expr> <C-x><C-o> coc#refresh()

nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> grt <Plug>(coc-type-definition)
nmap <silent> gri <Plug>(coc-implementation)
nmap <silent> grr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap grn <Plug>(coc-rename)
nmap gra <Plug>(coc-codeaction-cursor)
nmap grA <Plug>(coc-codeaction-source)
nmap grf <Plug>(coc-fix-current)

nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

nnoremap <silent><nowait> <space>c  :<C-u>CocList<cr>
