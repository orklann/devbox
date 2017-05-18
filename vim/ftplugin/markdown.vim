
" I am a tiltle
" |<TAB>
" Ouput:
" -------------
function! CompleteDashes()
  let prev_line = getline(line('.')-1)
  let len = strlen(prev_line)
  let dash_chars = repeat('-', len)
  call setline('.', dash_chars)
  call cursor('.', len+1)
endfunction

function! AutoComplete()
  let current_char = getline('.')[col('.')-1] 
  if current_char == '-'
    call CompleteDashes()
  endif
  startinsert!
endfunction

" only map tab key for .md buffer
inoremap <buffer> <Tab> <ESC>:call AutoComplete()<CR>
