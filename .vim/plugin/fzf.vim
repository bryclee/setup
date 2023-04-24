command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "rg --hidden --no-ignore --files" }))

nnoremap <C-T> :FZF<CR>
nnoremap <C-P> :Buffers<CR>
nnoremap <leader>tt :AllFiles<CR>

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

if has('nvim') || has('patch-8.2-191')
  let g:fzf_layout = {
        \ 'window': { 'width': 0.9, 'height': 0.9 } }
endif

let g:fzf_action = {
      \ 'ctrl-q': function('s:build_quickfix_list'),
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-x': 'split',
      \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {
      \ 'window': 'enew'
      \ }
let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']
        " \   'window': 'exec winheight(0)/2."new"'
  "       \   'window': { 'width': 0.7, 'height': 0.8 }
"   let g:fzf_preview_window = 'up:50%'
" endif
