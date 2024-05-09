" setlocal spell spelllang=en_us
set wrap
set linebreak
let g:markdown_fenced_languages = ['javascript', 'json']

setlocal conceallevel=2

hi def link TodoItemUnfinished Todo
hi def link TodoItemFinished Conceal
hi mkdCode ctermbg=0 ctermfg=green

function! s:toggleTodo() abort
  let l:line = getline('.')
  let l:item = matchstr(l:line, '^\s*\zs-\s\+\%(\[.\]\|(carry)\)\?\ze')
  if len(l:item) == 0
    return
  elseif match(l:item, '\[ \]') > -1
    let l:item = '[x]'
  elseif match(l:item, '\[[Xx]\]') > -1
    let l:item = '(carry)'
  elseif match(l:item, '(carry)') > -1
    let l:item = '[ ]'
  else
    " No matches case (blank line)
    let l:item = '[ ] '
  endif
  call setline(line('.'), substitute(l:line, '^\s*-\s\+\zs\%(\[.\]\|(carry)\)\?\ze', l:item, ''))
endfunction

nmap <buffer> <silent> <enter> :call <SID>toggleTodo()<CR>

command! -nargs=? -bang -buffer Daily call daily#daily_name(<f-args>)
command! -bang -buffer DailyLink call daily#daily_line()
