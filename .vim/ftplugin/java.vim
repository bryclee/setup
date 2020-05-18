setlocal makeprg=javac\ %
setlocal errorformat=%A%f%l\ %m,%-Z%p^,%-C%.%#
nnoremap <f10> :!java %:t:r<CR>
