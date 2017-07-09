" Call JsBeautify() after saving Javascript files
set tabstop=2
set expandtab

fu! ResetSpaces()
  %retab!
endfunction

augroup htmlfmt
  autocmd! BufWritePre <buffer> call JsBeautify()
  autocmd! BufWritePost <buffer> call ResetSpaces()
augroup END
