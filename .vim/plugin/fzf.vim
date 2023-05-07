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

function! Jumplist()
  redir => cout
  silent jumps
  redir END
  let s:last_jumplist = reverse(split(cout, "\n")[1:])
  let s:jump_start = get(filter(map(copy(s:last_jumplist),
        \ {key, val -> val[0] == ">" ? key : -1}),
        \ 'v:val > -1'), 0, 0)

  call fzf#run(fzf#wrap({
        \ 'source': s:last_jumplist,
        \ 'sink': function('GoToJump'),
        \ 'options': ['--no-sort', '--bind', 'load:pos(' . (s:jump_start + 1) . ')'] }))
endfunction
function! GoToJump(jump)
    let jumpnumber = split(a:jump, '\s\+')[0]
    let pos = index(s:last_jumplist, a:jump)
    execute "normal " . jumpnumber . (pos >= s:jump_start ? "\<c-o>" : "\<c-i>")
endfunction
command! Jumps call Jumplist()

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
nnoremap <leader>j :Jumps<CR>
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
