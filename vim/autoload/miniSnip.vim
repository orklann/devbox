let s:SNIP = {}

function! s:SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID$')
endfunction
let s:sid = s:SID()

function! miniSnip#trigger() abort
  let ret = ""

  if empty(s:SNIP)
    let file = s:findSnippetFile()
    if empty(file)
      echo "miniSnip: no snippet with that name"
      return ""
    else
      let s:SNIP = s:Snip(file)
      let ret .= "\<Esc>:call ".s:sid."parseFile()\<CR>"
      let ret .= "\<Esc>:call ".s:sid."insertSnippet()\<CR>"
    endif
  else
    let ret .= "\<Esc>:call ".s:sid."replaceRefs()\<CR>"
  endif

  return ret."\<Esc>:call ".s:sid."selectPlaceholder()\<CR>"
endfunction

function! miniSnip#clear() abort
  let s:SNIP = {}
  return ""
endfunction


function! s:getVar(var) abort
  return get(b:, "miniSnip_".a:var, eval("g:miniSnip_".a:var))
endfunction

function! s:directories() abort
  let filetypes = []
  if !empty(&ft)
    let filetypes = [ &ft ]
    let filetypes += get(s:getVar("extends"), &ft, [])
  endif
  let filetypes += [ "all" ]

  let dirs = !empty(s:getVar("local")) ? [ "./" . s:getVar("local") ] : []

  if empty(s:getVar("dirs"))
    let dirs += map(split(&runtimepath, ","), {_, val -> val."/miniSnip" })
  else
    let dirs += s:getVar("dirs")
  endif

  let ft_dirs = []

  for dir in dirs
    for ft in filetypes
      let d = dir . "/" . ft
      if isdirectory(d)
        call add(ft_dirs, d)
      endif
    endfor
  endfor

  return ft_dirs
endfunction

function! s:findSnippetFile() abort
  let cword = matchstr(getline('.'), s:getVar("exppat") . '\v%' . col('.') . 'c')
  let ext = "." . s:getVar("ext")
  let files = globpath(join(s:directories(), ','), cword.ext, 0, 1)
  return len(files) ? files[0] : ""
endfunction

function! s:Snip(file) abort
  return #{
        \   file: a:file,
        \   count: 0,
        \   pos: #{
        \     start: line('.'),
        \     end: line('.'),
        \     start_xy: [],
        \   },
        \   marks: #{
        \     op: s:getVar("opening"),
        \     ed: s:getVar("closing"),
        \     ref: s:getVar("refmark"),
        \     named: s:getVar("named"),
        \     finalTag: s:getVar("finalTag"),
        \     delimChg: s:getVar("delimChg"),
        \     desc: s:getVar("descmark"),
        \     noskip: s:getVar("noskip"),
        \     eval: s:getVar("evalmark"),
        \   },
        \   flags: #{
        \     customDelims: 0,
        \     named: 0,
        \   },
        \   temp: #{
        \     ph_begin_pos: [],
        \   },
        \ }
endfunction

function! s:updatePattern(str) abort
  " Check for delimeters changes
  if a:str =~ '^\V'.s:SNIP.marks.delimChg
    let delims = matchlist(a:str, '\V`\(\.\{-}\)` `\(\.\{-}\)`')
    if !empty(delims)
      let [ s:SNIP.marks.op, s:SNIP.marks.ed ] = delims[1:2]
      let s:SNIP.flags.customDelims = 1
    endif
  endif

  let op = s:SNIP.marks.op
  let ed = s:SNIP.marks.ed
  let ref = s:SNIP.marks.ref
  let finalTag = s:SNIP.marks.finalTag

  let s:SNIP.patterns = #{
        \   regular: '\V' . op . finalTag . '\@!\.\{-}' . ed,
        \   final: '\V' . op . finalTag . ed,
        \   counted: '\V'. op . ref . 'COUNT' . ed,
        \   named: '~ created in selectPlaceholder()',
        \ }

  return s:SNIP.flags.customDelims
endfunction

function! s:parseFile() abort
  let file = readfile(s:SNIP.file)

  " Remove description
  if file[0] =~ '^'.(s:SNIP.marks.desc)
    call remove(file, 0)
  endif

  " If custom delims were applied, remove line with them
  if s:updatePattern(file[0])
    call remove(file, 0)
  endif

  let s:SNIP.snippet = file
endfunction

function! s:insertSnippet() abort
  let snippet = s:SNIP.snippet

  " Adjust indentation (using current line as reference)
  let ws = matchstr(getline('.'), '^\s\+')
  let snippet = [ "\<Right>".snippet[0] ] + map(snippet[1:], 'ws.v:val')

  " Delete snippet key
  let snippet += [ strpart(getline('.'), col('.')) ] " save part after snippet
  exec 'norm! ?'. s:getVar("exppat") ."\<CR>" . '"_D' | call histdel('/', -1)

  " Get XY position of beginning of the snippet
  let s:SNIP.pos.start_xy = getpos('.')

  " Insert snippet
  exec "norm! i".join(snippet, "\<CR>\<Esc>i")."\<Esc>kgJ"

  " Get line the snippet ends at
  let s:SNIP.pos.end = line('.')
endfunction

function! s:evaluate(str) abort
  if a:str =~ '\V\^' . s:SNIP.marks.eval
    return eval(a:str[1:])
  elseif a:str =~ '\V\^' . (s:SNIP.marks.noskip) . (s:SNIP.marks.eval)
    return eval(a:str[2:])
  endif
  return a:str
endfunction

function! s:getInsertedText() abort
  let [line_start, column_start] = s:SNIP.temp.ph_begin_pos
  let [line_end, column_end] = getpos('.')[1:2]
  let lines = getline(line_start, line_end)
  if empty(lines) | return "" | endif
  let lines[-1] = lines[-1][: column_end-1]
  let lines[0] = lines[0][column_start - 1:]
  return join(lines, "\n")
endfunction

function! s:replaceRefs() abort
  let txt = escape(s:getInsertedText(), '/\\')
  let pos = getpos('.')
  let s:SNIP.count += 1
  undojoin

  let cnt_pattern = substitute(s:SNIP.patterns.counted, "COUNT", s:SNIP.count, "")
  let boundries = (s:SNIP.pos.start).','.(s:SNIP.pos.end)

  silent! exec boundries.'s/'.cnt_pattern.'/'.txt.'/g'
  if s:SNIP.flags.named
    silent! exec boundries.'s/'.s:SNIP.patterns.named.'/'.txt.'/g'
    let s:SNIP.flags.named = 0
  endif

  call setpos('.', pos)
endfunction

function! s:findPlaceholder(pat) abort
  let pos = getpos('.')
  call setpos('.', s:SNIP.pos.start_xy)

  let [sl, sc] = searchpos(a:pat, 'cw', s:SNIP.pos.end)
  if !sl " didn't found any placeholders
    call setpos('.', pos)
    return ""
  endif
  let [_, ec] = searchpos(a:pat, 'cnew', s:SNIP.pos.end)

  return getline(sl)[sc-1:ec-1]
endfunction

function! s:selectPlaceholder() abort
  let ph = s:findPlaceholder(s:SNIP.patterns.regular)
  if empty(ph)
    let ph = s:findPlaceholder(s:SNIP.patterns.final)
  endif

  if empty(ph)
    call miniSnip#clear()
    call feedkeys('a', 'n')
    return
  endif

  let ph_begin = virtcol('.')
  let s:SNIP.temp.ph_begin_pos = getpos('.')[1:2]

  " Delete placeholder
  exec 'norm! "_d'.strchars(ph).'l'

  let op = s:SNIP.marks.op
  let ed = s:SNIP.marks.ed
  let ph = ph[strchars(op) : -strchars(ed)-1]

  if ph == s:SNIP.marks.finalTag
    let ph = ""
  endif

  " Check for named reference; if yes, create pattern and set a flag
  if ph =~ '\V\^'.s:SNIP.marks.named
    let s:SNIP.patterns.named = '\V'.op.ph.ed
    let s:SNIP.flags.named = 1
    let ph = ph[1:]
  endif

  let canSkip = ph =~ '\V\^' . s:SNIP.marks.eval
  let ph = s:evaluate(ph)

  " Choose 'append' if placeholder is the last element in a line
  let ia = virtcol('.') == ph_begin - 1 ? 'a' : 'i'

  if empty(ph) " the placeholder was empty, so just enter insert mode directly
    call feedkeys(ia, 'n')
  elseif canSkip
    " Placeholder was evaluated and isn't marked 'noskip', so replace references and go to next
    exec 'norm! ' . ia . ph
    call s:replaceRefs()
    call s:selectPlaceholder()
  else " paste the placeholder's default value in and enter select mode on it
    exec 'norm! '. ia . ph . "\<Esc>v" . ph_begin . "|o\<C-g>"
  endif
endfunction


" --- Completion

function! s:buildComp(_, path) abort
  let l:name = fnamemodify(a:path, ':t:r')
  let l:snip = readfile(a:path)
  let l:description = ""

  let descmark = s:getVar("descmark")
  if l:snip[0] =~ '^'.descmark
    let l:description = substitute(l:snip[0], '^'.descmark.'\s\?', '', '')
  endif

  return {
        \   'word': l:name,
        \   'menu': l:description,
        \   'info': join(l:snip, "\n"),
        \   'kind': 's',
        \ }
endfunction

function! miniSnip#completeFunc(findstart, base) abort
  if a:findstart
    " Locate the start of the word
    let line = getline('.')
    let start = virtcol('.') - 1
    while start > 0 && line[l:start - 1] =~ s:getVar("exppat")
      let start -= 1
    endwhile

    return start
  endif

  " Load all snippets that match.
  let dirs = join(s:directories(), ',')
  let all = globpath(dirs, a:base.'*.'.s:getVar("ext"), 0, 1)
  call filter(all, {_, path -> filereadable(path)})
  call map(all, funcref('s:buildComp'))
  call sort(all, 'i')

  return all
endfunction

function! miniSnip#completeMapping() abort
  let cword = matchstr(getline('.'), s:getVar("exppat") . '\v%' . col('.') . 'c')
  if cword is# ' '
    let cword = ''
  endif
  let start = virtcol('.') - len(cword)
  call complete(start, miniSnip#completeFunc(0, cword))
  return ''
endfunction
