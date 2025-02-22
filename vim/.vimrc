call plug#begin()

Plug 'mhartington/oceanic-next'

Plug 'AnotherProksY/ez-window'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'augmentcode/augment.vim'

Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-completion'

Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'

Plug 'nicwest/vim-http'

call plug#end()

" Settings

colorscheme OceanicNext

set wildignore=*/node_modules/*,*/build/*,*/dist/*,*/env/*,/usr/local/include/*,/usr/include/*
set path+=**

let g:netrw_banner=0
let g:netrw_list_hide="node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"
set lazyredraw
set undofile
set grepprg="rg --vimgrep"
set undolevels=10000000
set undoreload=10000000
set termguicolors
set noswapfile
set smartindent expandtab shiftwidth=4 tabstop=4
set completeopt=menu,menuone,fuzzy,noinsert,popup
set linebreak
set smartcase incsearch
set mouse=a
set rnu nu
set updatetime=300
set signcolumn=yes
set laststatus=2
set hidden

syntax on
filetype plugin indent on

let g:augment_workspace_folders = [
            \ "~/code/personal/real-time-chat/",
            \ "~/code/personal/track-mouse/"
            \]

let color = '#000001'
execute 'highlight Normal guibg=' . color
execute 'highlight LineNr guibg=' . color
execute 'highlight StatusLine guibg=' . color
execute 'highlight SignColumn guibg=' . color
execute 'highlight EndOfBuffer guibg=' . color

autocmd BufWritePre * %s/\s\+$//e
autocmd FileType fugitive nmap q <cmd>clo<cr>

" Mappings

let g:ez_terminal_key = '<C-q>'

let g:mapleader=" "

nnoremap - <cmd>:Ex<cr>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
vnoremap <silent> K :m '<-2<cr>gv=gv
vnoremap <silent> J :m '>+1<cr>gv=gv
nnoremap <C-w>C <cmd>tabc<cr>
nnoremap <Tab> <cmd>tabn<cr>
nnoremap <S-Tab> <cmd>tabp<cr>
nnoremap <C-x> <cmd>bd<cr>
nnoremap <leader><C-x> <cmd>bd!<cr>
nnoremap <leader>q <cmd>copen<cr>
nnoremap <C-n> <cmd>cnext<cr>zz
nnoremap <C-p> <cmd>cprevious<cr>zz
xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <C-t> <cmd>!tmux neww tmux-sessionizer<cr>

nnoremap <leader>d :tabnew<cr>:DBUIToggle<cr>
nnoremap <leader>g :Git<cr>
nnoremap <leader>u :UndotreeToggle<cr><cmd>UndotreeFocus<cr>
nnoremap <leader>r :Http<cr>

nnoremap <leader>ac <cmd>Augment chat<cr>
vnoremap <leader>ac :Augment chat<cr>
nnoremap <leader>at <cmd>Augment chat-toggle<cr>
nnoremap <leader>an <cmd>Augment chat-new<cr>
nnoremap <leader>as <cmd>Augment status<cr>

cnoremap <C-b> <Left>
cnoremap b <C-Left>
cnoremap <C-l> <Right>
cnoremap l <C-Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap d <C-Del>

" Coc

nmap <silent> <leader>/ <cmd>execute 'CocList grep'<cr>
nmap <silent> <leader>f <cmd>execute 'CocList files'<cr>
nmap <silent> <C-w>t <cmd>tabnew<cr><cmd>execute 'CocList files'<cr>
nmap <silent> grd <cmd>execute 'CocList diagnostics'<cr>
nmap <silent> <leader>s <cmd>execute 'CocCommand clangd.switchSourceHeader'<cr>

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
