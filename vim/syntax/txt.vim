if exists('b:current_syntax')
    finish
endif

syntax case match

syntax match leftP /(/
syntax match RightP /)/
syntax match date /\d*-\d*-\d*/
syntax match DiaryDate "\v(Mon|Tue|Wed|Thu|Fri|Sat|Sun) (Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec) \d\d, \d\d\d\d"

highlight date ctermbg=green guibg=green
highlight DiaryDate ctermbg=green guibg=green

highlight leftP ctermfg=yellow guifg=yellow
highlight rightP ctermfg=yellow guifg=yellow

let b:current_syntax = 'txt'
