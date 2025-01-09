call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'fholgado/minibufexpl.vim'
Plug 'mhartington/oceanic-next'

call plug#end()

" Settings

colorscheme OceanicNext

set wildignore=*/node_modules/*,*/build/*,*/dist/*,*/env/*
set path+=**

let g:netrw_banner=0
let g:netrw_list_hide="node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"
set termguicolors
set undofile
set noswapfile
set smartindent expandtab shiftwidth=4 tabstop=4
set completeopt=menu,menuone,fuzzy,noinsert,popup
set linebreak
set smartcase incsearch
set mouse=a
set rnu nu
set updatetime=300
set signcolumn=yes
set laststatus=0
set hidden
syntax on

let color = '#000001'
execute 'highlight Normal guibg=' . color
execute 'highlight LineNr guibg=' . color
execute 'highlight StatusLine guibg=' . color
execute 'highlight SignColumn guibg=' . color
execute 'highlight EndOfBuffer guibg=' . color

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
nnoremap <C-j> <cmd>cnext<cr>zz
nnoremap <C-k> <cmd>cprevious<cr>zz
xnoremap P "0P
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap <C-t> <cmd>!tmux neww tmux-sessionizer<cr>
nnoremap <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <leader>t <cmd>execute '!tmux neww tmux-run ' . input("Run: ")<cr>

nnoremap <C-s> <cmd>MBEToggleAll<cr>

" Coc

inoremap <silent><expr> <C-x><C-o> coc#refresh()
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> grt <Plug>(coc-type-definition)
nmap <silent> gri <Plug>(coc-implementation)
nmap <silent> grr <Plug>(coc-references)
nmap grn <Plug>(coc-rename)
nmap gra <Plug>(coc-codeaction-cursor)
nmap grA <Plug>(coc-codeaction-source)
nmap grf <Plug>(coc-fix-current)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
nnoremap <silent><nowait> <leader>c  :<C-u>CocList<cr>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
