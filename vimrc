au BufRead,BufNewFile *.sass       setfiletype sass
au! BufRead,BufNewFile *.scss       setfiletype css
" Use vim settings, instead of vi
set nocompatible
set loadplugins
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
"nice scheme as well
"colorscheme desert

" make the mouse works under screen :
set ttymouse=xterm2
set mouse=ar

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
au filetype tmpl set omnifunc=htmlcomplete#CompleteTags

" Change the current tab with ^j and ^k (normal mode only)
nnoremap <silent> <C-j> <C-f>
nnoremap <silent> <C-k> <C-b>

" Easy way for ^, $
nnoremap <silent> e ^
vnoremap <silent> e ^
nnoremap <silent> r $
vnoremap <silent> r $
nnoremap <silent> t <Del>
nnoremap <silent> q 0

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

" Make !resize work in iTerm2
" Preferences -> Profiles -> {your profile} -> Terminal,
" Uncheck this "Disable session-initiated window resizing"
" Large window
cabbrev l silent exec "!resize -s 45 120"

" Smaller window
cabbrev s silent exec "!resize -s 45 80"

fun! LargerFont()
  silent exec '!echo -e "\033]50;SetProfile=Larger Takeshi\a"'
  redraw!
endfun

fun! SmallerFont()
  silent exec '!echo -e "\033]50;SetProfile=Takeshi\a"' | redraw!
  redraw!
endfun

" Larger font
cabbrev lf call LargerFont()
" Smaller font
cabbrev sf call SmallerFont()

" Fix auto jump to closing brace in auto-pairs
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

" yank also copy to system  pasteboad
set clipboard=unnamed

" encoding
set encoding=utf-8  " The encoding displayed.
set fileencoding=utf-8  " The encoding written to file.

" set relative line numbers
set nu

" Disable arrow keys for insert mode
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>

" Use goimports instead of gofmt
let g:gofmt_exe = 'goimports'
let g:gofmt_display_errors = 1

" Trim whitespace on save
" From: http://vim.wikia.com/wiki/Remove_unwanted_spaces
autocmd BufWritePre * %s/\s\+$//e

" Show status line always
set laststatus=2

" Set status line colors
hi statusline ctermbg=61 ctermfg=White

" Color groups for status lines
hi User1 ctermbg=61 ctermfg=Black
hi User2 ctermbg=61 ctermfg=White

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

" Fix 13_AutoPairsReturn
let g:AutoPairsMapCR=0

" Set default shell for Vim
set shell=/bin/sh
cd %:p:h

" Clear highlighting on escape in normal mode
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[
