" Highlight date
augroup diary
    autocmd!
    autocmd ColorScheme,BufRead,BufNewFile *
        \  syntax match DiaryDate "\v(Mon|Tue|Wed|Thu|Fri|Sat|Sun) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \d\d, \d\d\d\d"
        \| highlight DiaryDate ctermbg=green guibg=green
augroup END

