let g:ale_linters = {
      \ 'javascript': ['eslint', 'flow-language-server'],
      \ 'javascript.jsx': ['eslint', 'flow-language-server'],
      \ 'css': ['eslint'],
      \ 'typescript': ['tslint', 'tsserver'],
      \ 'typescript.tsx': ['tslint', 'tsserver'],
      \ 'clojure': ['clj-kondo'],
      \ 'yaml': ['yamllint']
      \ }
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'javascript': ['prettier', 'eslint'],
      \ 'javascript.jsx': ['prettier', 'eslint'],
      \ 'json': ['prettier'],
      \ 'typescript': ['prettier', 'tslint'],
      \ 'typescriptreact': ['prettier', 'tslint'],
      \ 'css': ['prettier'],
      \ 'markdown': ['prettier'],
      \ 'graphql': ['prettier'],
      \ 'java': ['google_java_format']
      \ }
" let g:ale_virtualtext_cursor = 1
nnoremap <silent> [g :ALEPreviousWrap<CR>
nnoremap <silent> ]g :ALENextWrap<CR>
