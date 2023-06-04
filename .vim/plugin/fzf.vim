command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "rg --hidden --no-ignore --files" }))

" ===
" === Jumps list and Change list
" ===
" from https://github.com/junegunn/fzf.vim/issues/865

function! s:format_jumplist_buffer(idx, bufnr, lnum, start)
  let name = fnamemodify(bufname(a:bufnr), ":p:~:.")
  let target = printf("%s:%d", name, a:lnum)
  let selected = a:start == a:idx
  let rel = a:idx - a:start
  let command = rel < 0 ? "i" : rel > 0 ? "o" : "x"
  return  printf("%s\t%d\t%s\t%s\t%s",
        \ target,
        \ a:lnum,
        \ command . abs(rel),
        \ (selected ? printf("\x1b[34m") : "") . target,
        \ trim(get(getbufline(a:bufnr, a:lnum), 0, '')) . (selected ? printf("\x1b[m") : ""))
endfunction

function! Jumplist()
  let jumplist = getjumplist()
  let jump_start = len(jumplist[0]) - jumplist[1] - 1
  let last_jumplist = copy(jumplist[0])

  if (jumplist[1] == len(jumplist[0]))
    " If current line is not in jumplist, then index is out of bounds, so we
    " add the current line to the jumplist for display
    call add(last_jumplist, {'bufnr': bufnr(), 'lnum': line('.')})
    let jump_start = 0
  endif

  let last_jumplist = map(reverse(last_jumplist), { index, val -> s:format_jumplist_buffer(index, val.bufnr, val.lnum, jump_start)})
  " call filter(last_jumplist, 'v:val[:0] != ":"') " Filter out empty buffers

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': last_jumplist,
        \ 'sink': function('s:goToJump'),
        \ 'options': ['--ansi', '-d', '\t', '--with-nth', '4..', '--no-sort', '--bind', 'load:pos(' . (jump_start + 1) . ')', '--preview-window', '+{2}-/2'] })))
endfunction
function! s:goToJump(jump)
    let command = split(a:jump, '\t')[2]
    if (command != 'x')
      execute "normal " . command[1:] . (command[:0] == 'i' ? "\<c-i>" : "\<c-o>")
    endif
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
