au! BufRead,BufNewFile *.sass       setfiletype sass 
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
"set title
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

inoremap <C-A> <Home>
inoremap <C-E> <End>
nnoremap <C-A> ^
nnoremap <C-E> $

" Hide coloration of found words
map <C-C> :nohlsearch<CR>

autocmd FileType Makefile noexpandtab
au filetype tmpl set omnifunc=htmlcomplete#CompleteTags

" Change the current tab with ^j and ^k (normal mode only)
nnoremap <silent> <C-j> <C-f>
nnoremap <silent> <C-k> <C-b>

" Easy way for ^
nnoremap <silent> 9 ^

" Change cursor while switching between insert mode and normal mode for iTerm2
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Fix: Delay while switching betweeen insert mode and normal mode 
set timeoutlen=1000 ttimeoutlen=0

" Dont show support message at startup
set shortmess=atI

" Use spaces while press tab
set expandtab

" Show line numbers
set nu

" In visual mode, use Y to copy to system clipboard
vnoremap Y "*y

" In normal mode, do the same with the current line
nnoremap Y "*yy

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

" Fix auto jump to closing brace in auto-pairs
let g:AutoPairsMultilineClose = 0
let g:AutoPairsFlyMode = 0

" Iterm2 (Optoin-^) not work in Vim, so we bind to <Ctrl-^) instead
let g:AutoPairsShortcutFastWrap="<C-e>"
