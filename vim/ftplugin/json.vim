" Call JsonBeautify() after saving json files
set tabstop=4
set expandtab

fu! ResetSpaces()
  %retab!
endfunction

augroup cssfmt
  autocmd! BufWritePre <buffer> call JsonBeautify()
  autocmd! BufWritePost <buffer> call ResetSpaces()
augroup END
