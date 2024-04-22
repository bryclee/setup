let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow-language-server'],
      \ 'javascript.jsx': ['eslint', 'flow-language-server'],
      \ 'css': ['eslint'],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'typescript.tsx': ['tslint', 'tsserver'],
      \ 'clojure': ['clj-kondo'],
      \ 'yaml': ['yamllint'],
      \ 'graphql': [],
      \ 'json': ['jsonlint'],
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'javascript.jsx': ['prettier', 'eslint'],
      \ 'json': ['prettier'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'typescriptreact': ['prettier', 'tslint'],
      \ 'css': ['prettier'],
      \ 'graphql': ['prettier'],
      \ 'java': ['google_java_format']
      \ }
" prettier doesn't quite work the way that I'd like for markdown
" \ 'markdown': ['prettier'],
" let g:ale_virtualtext_cursor = 1
nnoremap <silent> [d :ALEPreviousWrap<CR>
nnoremap <silent> ]d :ALENextWrap<CR>
