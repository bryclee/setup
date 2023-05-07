command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "rg --hidden --no-ignore --files" }))

" ===
" === Jumps list and Change list
" ===
" from https://github.com/junegunn/fzf.vim/issues/865
function! s:warn(message) abort
    echohl WarningMsg
    echomsg a:message
    echohl None
    return 0
endfunction

function! GetJumps()
  redir => cout
  silent jumps
  redir END
  return reverse(split(cout, "\n")[1:])
endfunction
function! GoToJump(jump)
    let jumpnumber = split(a:jump, '\s\+')[0]
    execute "normal " . jumpnumber . "\<c-o>"
endfunction
command! Jumps call fzf#run(fzf#wrap({
        \ 'source': GetJumps(),
        \ 'sink': function('GoToJump'),
        \ 'options': '--no-sort'}))

" function GoTo(jumpline)
"   let values = split(a:jumpline, ":")
"   execute "e ".values[0]
"   call cursor(str2nr(values[1]), str2nr(values[2]))
"   execute "normal zvzz"
" endfunction

" function GetLine(bufnr, lnum)
"   let lines = getbufline(a:bufnr, a:lnum)
"   if len(lines)>0
"     return trim(lines[0])
"   else
"     return ''
"   endif
" endfunction

" function Getjumps()
"     let jumps = []
"     let raw_jumps = reverse(copy(getjumplist()[0]))
"     for it in raw_jumps
"         if bufexists(it.bufnr)
"             call add(jumps, it)
"         endif
"     endfor
"     return jumps
" endfunction

" function! Jumps()
"   " Get jumps with filename added
"   let tmp_jump = Getjumps()
"   if(tmp_jump == [])
"         call s:warn('Empty jump list!')
"         return
"   endif
"   let jumps = map(Getjumps(),
"     \ { key, val -> extend(val, {'fname': getbufinfo(val.bufnr)[0].name }) })

"   let jumptext = map(copy(jumps), { index, val ->
"       \ (val.fname).':'.(val.lnum).':'.(val.col+1).': '.GetLine(val.bufnr, val.lnum) })

"   call fzf#run(fzf#vim#with_preview(fzf#wrap({
"         \ 'source': jumptext,
"         \ 'column': 1,
"         \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
"         \ 'sink': function('GoTo')})))
" endfunction

" command! Jumps call Jumps()

function! Changes()
  let changes  = reverse(copy(getchangelist()[0]))
  if(changes == [])
        call s:warn('Empty change list!')
        return
  endif

  let changetext = map(copy(changes), { index, val ->
      \ expand('%').':'.(val.lnum).':'.(val.col+1).': '.GetLine(bufnr('%'), val.lnum) })

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': changetext,
        \ 'column': 1,
        \ 'options': ['--delimiter', ':', '--bind', 'alt-a:select-all,alt-d:deselect-all', '--preview-window', '+{2}-/2'],
        \ 'sink': function('GoTo')})))
endfunction

command! Changes call Changes()

command! -bang -nargs=? -complete=dir BLines
      \ call fzf#vim#buffer_lines(<q-args>, {
      \ 'window': {'width': 1, 'height': 0.4, 'relative': v:true, 'yoffset': 1.0},
      \ 'options': ['--no-sort', '--scroll-off=3', '--bind', 'load:pos(' . line('.') . ')']
      \ }, <bang>0)

" ========
" Mappings

nnoremap <C-T> :FZF<CR>
nnoremap <C-P> :Buffers<CR>
nnoremap <leader>t :AllFiles<CR>
nnoremap <leader>O :Jumps<CR>
nnoremap <leader>C :Changes<CR>
nnoremap <leader>/ :BLines<CR>
nnoremap <leader>p :Lines<CR>

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {
      \ 'window': {'width':1, 'height':1, 'relative':v:true}
      \ }
let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']
        " \   'window': 'exec winheight(0)/2."new"'
  "       \   'window': { 'width': 0.7, 'height': 0.8 }
"   let g:fzf_preview_window = 'up:50%'
" endif



highlight fzf1 ctermfg=none ctermbg=0
highlight fzf2 ctermfg=none ctermbg=0
highlight fzf3 ctermfg=none ctermbg=0
