if has("nvim")
  finish
endif

" coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-html', 'coc-tsserver']
" ===================
" Set tab completion
inoremap <silent><expr> <TAB>
  \ pumvisible() ? coc#_select_confirm() : "\<TAB>"

" Go to definition
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>D <Plug>(coc-type-definition)
nmap <silent> <C-W><leader>d :call CocActionAsync('jumpDefinition', 'tabe')<CR>
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)
nmap <silent> <leader>R <Plug>(coc-rename)
nmap <silent> gh :call CocAction('doHover')<CR>
" <c-space> mapping on vim on mac has issues, this fixes it
inoremap <silent><expr> <c-space> coc#refresh()
nmap <silent> [G <Plug>(coc-diagnostic-prev)
nmap <silent> ]G <Plug>(coc-diagnostic-next)

autocmd CursorHold * silent call CocActionAsync('highlight')

" vim-lsp
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" let g:lsp_virtual_text_enabled = 0
" let g:lsp_diagnostics_float_cursor = 1
" " let g:lsp_highlight_references_enabled = 0

" function! s:on_lsp_buffer_enabled() abort
"     setlocal omnifunc=lsp#complete
"     setlocal signcolumn=yes
"     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"     nmap <buffer> <leader>d <plug>(lsp-definition)
"     nmap <buffer> <leader>r <plug>(lsp-references)
"     nmap <buffer> <leader>i <plug>(lsp-implementation)
"     nmap <buffer> <leader>t <plug>(lsp-type-definition)
"     nmap <buffer> <leader>R <plug>(lsp-rename)
"     nmap <buffer> [G <Plug>(lsp-previous-diagnostic)
"     nmap <buffer> ]G <Plug>(lsp-next-diagnostic)
"     nmap <buffer> K <plug>(lsp-hover)
"     imap <buffer> <c-space> <Plug>(asyncomplete_force_refresh)
"     imap <c-@> <c-space>

"     " refer to doc to add more commands
" endfunction

" " Dedupe results
" function! s:my_asyncomplete_preprocessor(options, matches) abort
"   let l:visited = {}
"   let l:items = []
"   for [l:source_name, l:matches] in items(a:matches)
"     for l:item in l:matches['items']
"       if stridx(l:item['word'], a:options['base']) == 0
"         if !has_key(l:visited, l:item['word'])
"           call add(l:items, l:item)
"           let l:visited[l:item['word']] = 1
"         endif
"       endif
"     endfor
"   endfor

"   call asyncomplete#preprocess_complete(a:options, l:items)
" endfunction

" let g:asyncomplete_preprocessor = [function('s:my_asyncomplete_preprocessor')]

" augroup lsp_install
"     au!
"     " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"     autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
" augroup END