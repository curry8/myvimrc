call plug#begin('~/.config/nvim/autoload')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdcommenter'
Plug 'KabbAmine/zeavim.vim'
call plug#end()

let mapleader = "\<space>"
inoremap jj <Esc>
nnoremap Q :qall<CR>
nnoremap L :bn<CR>
nnoremap H :bp<CR>
set showcmd
set list
set autoindent
set tabstop=4
set softtabstop=2
set shiftwidth=2

filetype plugin on
set showmatch
set matchtime
set noshowmode
set novisualbell
set noerrorbells
set report=0
set ignorecase smartcase
set nobackup
set autoread
set hlsearch
syntax on

set smartindent
set history=1000

set fileencodings=utf-8,gb2312,gbk,cp936,latin-1
set fileencoding=utf-8
set termencoding=utf-8
set fileformat=unix
set encoding=utf-8

" 用空格代替tab
set expandtab

set nu
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

function! HideNumber()
  if(&relativenumber == &number)
    set number!
    set relativenumber!
  elseif(&number)
    set number!
  else
    set relativenumber!
  endif
  set number?
endfunc
nnoremap <F2> :call HideNumber()<CR>
nnoremap <F4> :call IndentLinesToggle<CR>

" ========================== colorscheme ====================
"set t_Co=256
"set termguicolors
"set background=dark
"hi ExtraWhitespace ctermbg=red guibg=red
"hi Todo ctermbg=red guibg=red

let g:airline_theme = 'one'
let g:gruvbox_material_backgroud= 'hard'
"colorscheme one
"colorscheme molokai

set laststatus=2

let g:python_highlight_all = 1
" 可視化縮進
let g:indent_guides_enable_on_vim_startup = 0 
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
au FileType json let g:indentLine_etConceal = 0

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"" coc使用tab選擇
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh

" use <cr> to confirm completion. `<C-g>u` means break undo chain at current
" Coc only does snippet and additional editon confirm
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

command! -nargs=0 Format :call CocActionAsync("format")

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

"tagbar
let g:tagbar_width=30

"vim-airline
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode =1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0',
       \ '1': '1',
       \ '2': '2',
       \ '3': '3',
       \ '4': '4',
       \ '5': '5',
       \ '6': '6',
       \ '7': '7',
       \ '8': '8',
       \ '9': '9',
       \}
let g:airline = {
      \ 'active' : {
      \   'left' : [ [ 'mode', 'paste' ],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \},
      \ 'component_function': {
      \    'gitbranch': 'gitbranch#name'
      \},
      \}


let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#branch#enabled = 1
"!exists('g:airline_symbols')let g:airline_symbols = {}endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'

" zeavim
nmap <leader>z <Plug>Zeavim
vmap <leader>z <Plug>ZVVisSelection
nmap gz <Plug>ZVOperator
nmap <leader><leader>z <Plug>ZVKeyDocset
