call plug#begin()
" Theme
Plug 'mhartington/oceanic-next'

" UI Enhancements
Plug 'AnotherProksY/ez-window'
Plug 'mbbill/undotree'

" IDE Features
Plug 'augmentcode/augment.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'puremourning/vimspector'

" Database
Plug 'kristijanhusak/vim-dadbod-ui'
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-completion'

" Development Tools
Plug 'nicwest/vim-http'
Plug 'tpope/vim-fugitive'

call plug#end()

" Settings

colorscheme OceanicNext

set wildignore=*/node_modules/*,*/build/*,*/dist/*,*/env/*,/usr/local/include/*,/usr/include/*
set path+=**

let g:netrw_banner=0
let g:netrw_list_hide="node_modules/,^\\.\\=/\\=$,^\\.\\.\\=/\\=$"
let g:netrw_altfile = 1
let g:netrw_fastbrowse = 0

set lazyredraw ttyfast
set synmaxcol=200
set undofile
set grepprg="rg --vimgrep"
set undolevels=10000000
set undoreload=10000000
set termguicolors
set noswapfile
set smartindent expandtab shiftwidth=4 tabstop=4
set completeopt=menu,menuone,fuzzy,noinsert,popup
set linebreak
set smartcase incsearch ignorecase hlsearch
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

augroup vimrc_autocmds
    autocmd!
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
    autocmd FileType fugitive nmap q <cmd>clo<cr>
    autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
    autocmd BufWritePre * %s/\s\+$//e
    autocmd FocusGained,BufEnter * checktime
    autocmd FileType netrw setl bufhidden=wipe
augroup END

" Mappings

let g:ez_terminal_key = '<C-q>'

let g:mapleader=" "

cmap W! w !sudo tee > /dev/null %

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
nnoremap <silent> <leader><leader> :nohlsearch<CR>
nnoremap - <cmd>:Ex<cr>
vnoremap <silent> K :m '<-2<cr>gv=gv
vnoremap <silent> J :m '>+1<cr>gv=gv
nnoremap <silent> <C-w>C <cmd>tabc<cr>
nnoremap <silent> i <cmd>tabn<cr>
nnoremap <silent> o <cmd>tabp<cr>
nnoremap <silent> <C-z> <cmd>bd<cr>
nnoremap <silent> <leader><C-z> <cmd>bd!<cr>
nnoremap <silent> <leader>q <cmd>copen<cr>
nnoremap <silent> <C-n> <cmd>cnext<cr>zz
nnoremap <silent> <C-p> <cmd>cprevious<cr>zz

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
vnoremap y myy`y
vnoremap Y myY`y
nnoremap <leader>p p`[v`]=

cnoremap <C-b> <Left>
cnoremap b <C-Left>
cnoremap <C-f> <Right>
cnoremap f <C-Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap d <C-Del>

nnoremap <silent> <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <silent> <C-t> <cmd>!tmux neww tmux-sessionizer<cr>

nnoremap <silent> <C-g><C-g> :Git<cr>
nnoremap <silent> <C-g>l :GlLog<cr>
nnoremap <C-g>c :G checkout hash

nnoremap <silent> <C-x><C-d> :tabnew<cr>:DBUIToggle<cr>
nnoremap <silent> <C-x><C-u> :UndotreeToggle<cr><cmd>UndotreeFocus<cr>
nnoremap <silent> <C-x><C-s>s <cmd>CocCommand session.save<cr>
nnoremap <silent> <C-x><C-s>l <cmd>CocCommand session.load<cr>
autocmd FileType http vnoremap <silent> R :Http<cr>

vnoremap <C-a>c :Augment chat<cr>
nnoremap <C-a>c <cmd>Augment chat<cr>
nnoremap <silent> <C-a>t <cmd>Augment chat-toggle<cr>
nnoremap <silent> <C-a>n <cmd>Augment chat-new<cr>
nnoremap <silent> <C-a>s <cmd>Augment status<cr>

nnoremap <silent> <leader>r <cmd>VimspectorReset<cr>
nnoremap <silent> <leader>c <cmd>call vimspector#Continue()<cr>
nnoremap <silent> <leader>b <cmd>call vimspector#ToggleBreakpoint()<cr>
nnoremap <silent> <leader>n <cmd>call vimspector#StepOver()<cr>
nnoremap <silent> <leader>s <cmd>call vimspector#StepInto()<cr>
nnoremap <silent> <leader>o <cmd>call vimspector#StepOut()<cr>

nnoremap <silent> <C-f> <cmd>CocList grep<cr>
nnoremap <silent> <C-f><C-f> <cmd>CocList files<cr>
nnoremap <silent> <C-f><C-k> <cmd>CocList maps<cr>
nnoremap <silent> <C-f><C-h> <cmd>CocList helptags<cr>
nnoremap <silent> <C-f><C-r> <cmd>CocList registers<cr>
nnoremap <silent> <C-f><C-t> <cmd>tabnew<cr><cmd>CocList files<cr>

" Coc

inoremap <silent><expr> <C-x><C-o> coc#refresh()
nnoremap <silent> s <cmd>CocCommand clangd.switchSourceHeader<cr>
nnoremap <silent> <C-]> <Plug>(coc-definition)
nnoremap <silent> grt <Plug>(coc-type-definition)
nnoremap <silent> gri <Plug>(coc-implementation)
nnoremap <silent> grr <Plug>(coc-references)
nnoremap <silent> grd <cmd>CocList diagnostics<cr>
nnoremap grn <Plug>(coc-rename)
nnoremap gra <Plug>(coc-codeaction-cursor)
nnoremap grA <Plug>(coc-codeaction-source)
nnoremap grf <Plug>(coc-fix-current)
nnoremap <silent> [d <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]d <Plug>(coc-diagnostic-next)
nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
nnoremap <silent><nowait> <leader>C  :<C-u>CocList<cr>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
