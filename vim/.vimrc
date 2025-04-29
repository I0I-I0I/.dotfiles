call plug#begin()
" Theme
Plug 'mhartington/oceanic-next'

Plug 'augmentcode/augment.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'skywind3000/asyncrun.vim'
Plug 'mbbill/undotree'

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
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case\ --hidden
set grepformat=%f:%l:%c:%m
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

let g:mapleader=" "

cmap W! w !sudo tee > /dev/null %

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap <C-y> 3<C-y>
nnoremap <C-e> 3<C-e>
nnoremap <silent> <leader><leader> :nohlsearch<CR>
nnoremap Q <nop>
nnoremap - <cmd>:Ex<cr>
vnoremap <silent> K :m '<-2<cr>gv=gv
vnoremap <silent> J :m '>+1<cr>gv=gv
nnoremap <silent> <C-w>C <cmd>tabc<cr>
nnoremap <silent> o <cmd>tabn<cr>
nnoremap <silent> i <cmd>tabp<cr>
nnoremap <silent> O <cmd>tabmove +<cr>
nnoremap <silent> I <cmd>tabmove -<cr>
nnoremap <silent> <C-z> <cmd>bd<cr>
nnoremap <silent> <leader><C-z> <cmd>bd!<cr>
nnoremap <silent> <leader>q :copen \| wincmd p<cr>
nnoremap <silent> <C-n> <cmd>cnext<cr>zz
nnoremap <silent> <C-p> <cmd>cprevious<cr>zz

xnoremap "+y y:call system("wl-copy", @")<cr>
nnoremap "+p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p

nnoremap <silent> <C-@> <cmd>execute '!tmux neww tmux-yazi ' . expand("%:p:h")<cr>
nnoremap <silent> <C-t> <cmd>!tmux neww tmux-sessionizer<cr>

" Plugins

nnoremap <silent> <C-f><C-f> <cmd>CocList files<cr>
nnoremap <silent> <C-f> <cmd>CocList grep<cr>
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
nnoremap <silent><nowait> <C-g>c :<C-u>CocList<cr>

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Debug

function! SetDebugProgram()
    let program_path = input('Enter program path: ', getcwd() . '/build/', 'file')
    echo program_path
    let g:vimspector_configurations = {
          \ 'debug_program': {
          \   'adapter': 'vscode-cpptools',
          \   'configuration': {
          \     'request': 'launch',
          \     'program': program_path,
          \     'stopOnEntry': v:true,
          \     'cwd': '${workspaceFolder}',
          \   }
          \ }
          \}
endfunction

command! SetDebugProgram call SetDebugProgram()
