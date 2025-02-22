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
augroup END

" Mappings

let g:ez_terminal_key = '<C-q>'

let g:mapleader=" "

cmap w!! w !sudo tee > /dev/null %

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
nnoremap <silent> <leader><leader> :nohlsearch<CR>
nnoremap <leader> - <cmd>:Ex<cr>
vnoremap <silent> K :m '<-2<cr>gv=gv
vnoremap <silent> J :m '>+1<cr>gv=gv
nnoremap <silent> <C-w>C <cmd>tabc<cr>
nnoremap <silent> <Tab> <cmd>tabn<cr>
nnoremap <silent> <S-Tab> <cmd>tabp<cr>
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
cnoremap <C-l> <Right>
cnoremap l <C-Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap d <C-Del>

nnoremap <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <C-t> <cmd>!tmux neww tmux-sessionizer<cr>

nnoremap <C-s>d :tabnew<cr>:DBUIToggle<cr>
nnoremap <C-s>g :Git<cr>
nnoremap <C-s><C-g>l :GlLog<cr>
nnoremap <C-s><C-g>c :G checkout hash
nnoremap <C-s>u :UndotreeToggle<cr><cmd>UndotreeFocus<cr>
vnoremap <C-s>r :Http<cr>

nnoremap <C-a>c <cmd>Augment chat<cr>
vnoremap <C-a>c :Augment chat<cr>
nnoremap <C-a>t <cmd>Augment chat-toggle<cr>
nnoremap <C-a>n <cmd>Augment chat-new<cr>
nnoremap <C-a>s <cmd>Augment status<cr>

nnoremap <leader>r <cmd>VimspectorReset<cr>
nnoremap <leader>c <cmd>call vimspector#Continue()<cr>
nnoremap <leader>b <cmd>call vimspector#ToggleBreakpoint()<cr>
nnoremap <leader>n <cmd>call vimspector#StepOver()<cr>
nnoremap <leader>s <cmd>call vimspector#StepInto()<cr>
nnoremap <leader>o <cmd>call vimspector#StepOut()<cr>

nnoremap <silent> <C-f>/ <cmd>execute 'CocList grep'<cr>
nnoremap <silent> <C-f>f <cmd>execute 'CocList files'<cr>
nnoremap <silent> <C-f>t <cmd>tabnew<cr><cmd>execute 'CocList files'<cr>

nmap <silent> <C-s><C-s>s <cmd>execute 'CocCommand session.save'<cr>
nmap <silent> <C-s><C-s>l <cmd>execute 'CocCommand session.load'<cr>

" Coc

inoremap <silent><expr> <C-x><C-o> coc#refresh()
nmap <silent> s <cmd>execute 'CocCommand clangd.switchSourceHeader'<cr>
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> grt <Plug>(coc-type-definition)
nmap <silent> gri <Plug>(coc-implementation)
nmap <silent> grr <Plug>(coc-references)
nmap <silent> grd <cmd>execute 'CocList diagnostics'<cr>
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
