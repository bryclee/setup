map <C-T> :FZF<CR>
map <C-P> :Buffers<CR>

command! -bang -nargs=* AllFiles call fzf#run(fzf#wrap({ 'source': "find -L * -path '*/\.*' -prune -o -type f -print -o -type l -print 2> /dev/null" }))

" if has('nvim') || has('patch-8.2-191')
"   let g:fzf_layout = {
"         \ 'window': 'enew'
"         \ }
"         " \   'window': 'exec winheight(0)/2."new"'
"   "       \   'window': { 'width': 0.7, 'height': 0.8 }
"   let g:fzf_preview_window = 'up:50%'
" endif
