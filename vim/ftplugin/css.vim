" Call CSSBeautify() after saving css files
set tabstop=4
set expandtab

fu! ResetSpaces()
  %retab!
endfunction

augroup cssfmt
  autocmd! BufWritePre <buffer> call CSSBeautify()
  autocmd! BufWritePost <buffer> call ResetSpaces()
augroup END
