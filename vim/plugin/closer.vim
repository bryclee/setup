augroup closer-custom
  au!
  au FileType * let b:closer = 1 | let b:closer_flags = '([{'
augroup END
Plug 'alvan/vim-closetag', { 'for': 'html,javascript,typescriptreact' }
let g:closetag_regions = {
      \ 'typescript': 'jsxRegion,tsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascript': 'jsxRegion',
      \ 'javascript.jsx': 'jsxRegion'
      \ }
let g:closetag_filenames = '*.html,*.js,*.jsx,*.tsx'
let g:closetag_xhtml_filenames = '*.js,*.jsx,*.tsx'
let g:closetag_emptyTags_caseSensitive = 1
