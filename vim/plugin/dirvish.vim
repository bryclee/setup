let g:dirvish_mode = ':sort ,^.*[\/],'
augroup dirvish_config
  autocmd!
  " autocmd filetype dirvish silent! unmap <buffer> /
  " autocmd filetype dirvish silent! unmap <buffer> ?
  " autocmd filetype dirvish silent! unmap <buffer> p
  autocmd filetype dirvish silent! unmap <buffer> <c-p>
  autocmd filetype dirvish setlocal nonumber
augroup END
