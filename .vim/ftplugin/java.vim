setlocal makeprg=javac\ %
setlocal errorformat=%A%f%l\ %m,%-Z%p^,%-C%.%#
nnoremap <f10> :make<CR>:bot sp \| term java %:t:r<CR>
