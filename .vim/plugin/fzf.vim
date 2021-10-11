if has("nvim")
  finish
endif

command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "rg --hidden --no-ignore --files" }))

nnoremap <C-T> :FZF<CR>
nnoremap <C-P> :Buffers<CR>
nnoremap <leader>tt :AllFiles<CR>

let g:fzf_layout = {
      \ 'window': {
        \ 'width': 0.8,
        \ 'height': 0.8
      \ }
    \ }
" if has('nvim') || has('patch-8.2-191')
"   let g:fzf_layout = {
"         \ 'window': 'enew'
"         \ }
"         " \   'window': 'exec winheight(0)/2."new"'
"   "       \   'window': { 'width': 0.7, 'height': 0.8 }
"   let g:fzf_preview_window = 'up:50%'
" endif
