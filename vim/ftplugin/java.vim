setlocal makeprg=javac\ %
setlocal errorformat=%A%f%l\ %m,%-Z%p^,%-C%.%#
if has("nvim")
  nnoremap <f10> :make<CR>:bot sp \| term java %:r<CR>
else
  nnoremap <f10> :make<CR>:term java %:r<CR>
endif
