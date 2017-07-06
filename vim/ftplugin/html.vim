" Call HtmlBeautify() after saving html files
set tabstop=4
set expandtab

fu! ResetSpaces()
  %retab!
endfunction

augroup dartfmt
  autocmd! BufWritePre <buffer> call HtmlBeautify()
  autocmd! BufWritePost <buffer> call ResetSpaces()
augroup END
