command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "rg --hidden --no-ignore --files" }))

" ===
" === Jumps list and Change list
" ===
" from https://github.com/junegunn/fzf.vim/issues/865

function! s:format_jumplist_buffer(idx, bufnr, lnum, start)
  " let name = fnamemodify(bufname(a:bufnr), ":~:.")
  let bufname = bufname(a:bufnr)
  let name = empty(bufname) ? '[No Name]' : bufname
  let target = printf("%s:%d", name, a:lnum)
  let selected = a:start == a:idx
  let rel = a:start - a:idx
  return  printf("%s\t%d\t%s\t%s\t%s",
        \ target,
        \ a:lnum,
        \ rel,
        \ printf("\x1b[%sm%s\x1b[m", selected ? '33;1' : '', target),
        \ printf("\x1b[90m%s\x1b[m", trim(get(getbufline(a:bufnr, a:lnum), 0, ''))))
endfunction

function! Jumplist()
  let jumplist = getjumplist()
  let jump_start = jumplist[1] + 1
  let last_jumplist = copy(jumplist[0])

  if (jumplist[1] == len(jumplist[0]))
    " If current line is not in jumplist, then index is out of bounds, so we
    " add the current line to the jumplist for display
    call add(last_jumplist, {'bufnr': bufnr(), 'lnum': line('.')})
    let jump_start = 0
  endif

  let last_jumplist = map(last_jumplist, { index, val -> s:format_jumplist_buffer(index, val.bufnr, val.lnum, jumplist[1])})

  call fzf#run(fzf#vim#with_preview(fzf#wrap({
        \ 'source': last_jumplist,
        \ 'sink': function('s:goToJump'),
        \ 'options': ['--scroll-off', '3', '--tac', '-d', '\t', '--with-nth', '3..', '--no-sort', '--bind', 'load:pos('.(-jump_start).')', '--preview-window', '+{2}-/2', '--ansi', '--prompt', 'Jumps> '] })))
endfunction
function! s:goToJump(jump)
    let command = split(a:jump, '\t')[2]
    if (command != '0')
      execute "normal " . abs(command) . (command[:0] == '-' ? "\<c-i>" : "\<c-o>")
    endif
endfunction

command! Jumps2 call Jumplist()

command! -bang -nargs=? -complete=dir BLines2
      \ call fzf#vim#buffer_lines(<q-args>, {
      \ 'window': {'width': 1, 'height': 0.4, 'relative': v:true, 'yoffset': 1.0},
      \ 'options': ['--scroll-off=3', '--bind', 'load:pos(' . line('.') . '),change:first']
      \ }, <bang>0)

" ========
" Mappings

nnoremap <silent> <leader>p :FZF<CR>
nnoremap <silent> <leader>t :Buffers<CR>
nnoremap <silent> <leader>P :AllFiles<CR>
nnoremap <silent> <leader>o :Jumps2<CR>
nnoremap <silent> <leader>/ :BLines2<CR>
nnoremap <silent> <leader>st :Rg<CR

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
