" Call HtmlBeautify() after saving html files
set tabstop=4
set expandtab

fu! ResetSpaces()
  %retab!
endfunction

augroup htmlfmt
  autocmd! BufWritePre FileType html <buffer> call HtmlBeautify()
  autocmd! BufWritePost FileType html <buffer> call ResetSpaces()
augroup END
