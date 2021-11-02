let s:daily_script = '~/Projects/notes/daily'

function! daily#daily_name(...) abort
  if a:0
    let l:f = a:1
  else
    let l:f = ""
  endif
  let l:file = trim(system(s:daily_script . ' ' . l:f))
  execute 'edit ' . l:file
endfunction

function! daily#daily_line() abort
  let l:line = getline('.')
  let l:lineitems = matchlist(l:line, '^\(\s*-\( \[.\]\| (carry)\)\? \)\(.*\)')
  if len(l:lineitems) == 0
    return
  endif
  let l:filename = l:lineitems[3]
  let l:filename = substitute(l:filename, '\s', '-', 'g')
  let l:filename = substitute(l:filename, '[^0-9A-Za-z-_]', '', 'g')
  let l:file = trim(system(s:daily_script . ' ' . shellescape(l:filename)))
  let l:file = substitute(l:file, expand('%:p:h'), '.', '')
  call setline(line("."), l:lineitems[1] . '[' . l:lineitems[3] . '](' . l:file . ')')
  execute 'edit ' . l:file
endfunction
