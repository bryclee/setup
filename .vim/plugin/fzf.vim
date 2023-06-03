command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "rg --hidden --no-ignore --files" }))

" ===
" === Jumps list and Change list
" ===
" from https://github.com/junegunn/fzf.vim/issues/865

function! Jumplist()
  " redir => cout
  " silent jumps
  " redir END
  let jumplist = getjumplist()
  let raw_jumps = reverse(copy(jumplist[0]))
  let s:jump_start = len(raw_jumps) - jumplist[1] - 1
  let jumps = map(copy(raw_jumps), { index, val ->
        \ (bufname(val.bufnr)) . ':' . (val.lnum) . ':' . (val.col+1) . ': ' . (trim(get(getbufline(val.bufnr, val.lnum), 0, ''))) })
        " \ (getbufinfo(val.bufnr)[0].name) . ':' . (val.lnum) . ':' . (val.col+1) . ': ' . (trim(get(getbufline(val.bufnr, val.lnum), 0, ''))) })
  let s:last_jumplist = jumps
  " let s:last_jumplist = reverse(split(cout, "\n")[1:])

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': jumps,
        \ 'sink': function('GoToJump'),
        \ 'options': ['--delimiter', ':', '--no-sort', '--bind', 'load:pos(' . (s:jump_start + 1) . ')', '--preview-window', '+{2}-/2'] })))
endfunction
function! GoToJump(jump)
    " let jumpnumber = split(a:jump, '\s\+')[0]
    let pos = index(s:last_jumplist, a:jump)
    let jumpnumber = abs(pos - s:jump_start)
    " echom pos . ':' . s:jump_start . ':' . jumpnumber
    execute "normal " . jumpnumber . (pos >= s:jump_start ? "\<c-o>" : "\<c-i>")
endfunction

command! Jumps call Jumplist()

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
nnoremap <leader>o :Jumps<CR>
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
