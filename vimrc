au BufRead,BufNewFile *.sass       setfiletype sass
au! BufRead,BufNewFile *.scss       setfiletype css
" Use vim settings, instead of vi
set nocompatible
set loadplugins
" no swap files
set noswapfile
" Load snippets.vim
" Reindent operations (<< and >>)
""" BIKESHEDDING set shiftwidth=4
" 4 space tab
""" BIKESHEDDING set tabstop=4
" Causes backspace to delete 4 spaces
""" BIKESHEDDING set softtabstop=4
" Replaces a <TAB> with spaces
""" BIKESHEDDING set expandtab
" Uses shiftwidth instead of tabstop at start of lines
set smarttab
set modeline
set ruler
set history=100
set nowrap
" Change terminal title
set title
" No annoying error noises
set noerrorbells
" Make backspace delete lots of things
set backspace=indent,eol,start
" Show us the command we're typing
set showcmd
" Highlight matching parens
set showmatch
" Search options: incremental search, highlight search
set hlsearch
set incsearch
" Selective case insensitivity
set smartcase
" Show full tags when doing search completion
set showfulltag
" Speed up macros
set lazyredraw
" No annoying error noises
set noerrorbells
" Wrap on these
set whichwrap+=<,>,[,]
" Use the cool tab complete menu
set wildmenu
set wildmode=longest,full
set wildignore+=*.o,*~,*.pyc
" Allow edit buffers to be hidden
set hidden
" 1 height windows
set winminheight=1
" misc
set autowrite

if exists('+autochdir')
    set autochdir
endif
set ttyfast
set smartcase

filetype indent on
filetype plugin on
set autoindent
set smartindent
syntax on

colorscheme sidonia

" make the mouse works under screen :
" Comment out these 2 lines for fix neovide error
"set ttymouse=xterm2
"set mouse=ar

" Change buffer
map <C-N> :tabnext<CR>
map <C-P> :tabprevious<CR>

"inoremap <C-A> <Home>
"inoremap <C-E> <End>
"nnoremap <C-A> ^
"nnoremap <C-E> $

" Hide coloration of found words
map <C-C> :nohlsearch<CR>

autocmd FileType Makefile noexpandtab

" Change the current tab with ^j and ^k (normal mode only)
nnoremap <silent> <C-j> <C-f>
nnoremap <silent> <C-k> <C-b>

" Easy way for ^, $
nnoremap <silent> e ^
vnoremap <silent> e ^
nnoremap <silent> r $
vnoremap <silent> r $
nnoremap <silent> t 0
vnoremap <silent> t 0
nnoremap <silent> s e

" gg, GG shortcuts
noremap <silent> <nowait> G GG

" Change cursor while switching between insert mode and normal mode for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Fix: Delay while switching betweeen insert mode and normal mode
set timeoutlen=1000 ttimeoutlen=0

" Dont show support message at startup
set shortmess=atI

" Use spaces while press tab
set expandtab

" Dont show line numbers
set nonu

" In visual mode, use Y to copy to system clipboard
vnoremap Y "*y

" In normal mode, do the same with the current line
nnoremap Y "*yy

" vv = V
nnoremap vv V

" :ls to show buffers
"
cabbrev t tabedit

" yank also copy to system  pasteboad
set clipboard=unnamed

" yank also copy to system clipboard for Ubuntu
set clipboard=unnamedplus

" encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" set relative line numbers
set nonu

" Disable arrow keys for insert mode
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Trim whitespace on save
" From: http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Show status line always
set laststatus=2

fun! GetPaddingSpaces(s)
  let w = winwidth('%')
  let width = &modified ? w - 1: w
  let padding = (width - len(a:s)) / 2
  return repeat('\ ', padding)
endfun

fun! GetStatus()
  let sign = &modified ? '*' : ''
  let lineNumber= repeat('1', len(printf('%i', getline('.'))))
  let columnNumber = repeat('1', len(printf('%i', virtcol('.'))))
  let fullPath = fnameescape(pathshorten(expand('%:p:h')))
  let filename = fnameescape(expand('%:t'))
  let path = fullPath.'/'.filename.':'.lineNumber.':'.columnNumber
  let spaces = GetPaddingSpaces(path)
  " Show file encoding on status line
  "let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l'."%=%2*%{''.(&fenc!=''?&fenc:&enc).''}"
  let s = 'set statusline=%2*'.sign.spaces.'%1*'.fullPath.'/%2*'.filename.'%1*:%l:%2*%c'
  exec s
endfun

autocmd CursorMovedI * call GetStatus()
autocmd BufWritePost * call GetStatus()
autocmd BufRead,BufNewFile * call GetStatus()
autocmd! BufRead,BufNewFile * call GetStatus()
autocmd! BufEnter * call GetStatus()
autocmd VimEnter * call GetStatus()

" Command light hight
set cmdheight=1

" New line
nmap <CR> o<Esc>i

" Disable arrow keys navigation to force me not to use them
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Set status line colors
hi statusline ctermbg=61 ctermfg=White
" Set status line colors for Neovide
hi statusline guibg=#5F5FAF guifg=White

" Color groups for status lines"
hi User1 ctermbg=61 ctermfg=Black
hi User2 ctermbg=61 ctermfg=White

" Color groups for status lines for Neovide
hi User1 guibg=#5F5FAF guifg=#303645
hi User2 guibg=#5F5FAF guifg=White

" Custom tab bar colors
"
hi TabLineSel term=none cterm=none ctermbg=1 guifg=black guibg=#5F5FAF
hi TabLine term=none cterm=none guibg=#A08367
hi TabLineFill term=none cterm=none ctermbg=none

" Cursor Line
hi CursorLine term=none cterm=none

" Wrap text to textwidth: set textwidth=80, and use this command
nmap <C-L> gqG

nnoremap y "+y
vnoremap y "+y

" Limit autocomplete popup window height to 30 rows
set pumheight=30

" Press tab to switch to next tab
nnoremap <Tab> :tabnext<CR>
