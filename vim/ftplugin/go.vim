set tabstop=4
set expandtab

fu! ResetSpaces()
  %retab!
endfunction

augroup gofmt
  autocmd! BufWritePre <buffer>
        \ if get(g:, 'gofmt_on_save', 1) |
        \   call gofmt#apply() |
        \ endif
  autocmd! BufWritePost <buffer> call ResetSpaces()
augroup END

command! -buffer Gofmt call gofmt#apply()


