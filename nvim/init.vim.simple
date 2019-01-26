set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath =&runtimepath
" source ~/.vim/vimrc

call plug#begin('~/.vim/plugged')

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

call plug#end()

augroup filetype_rust
    autocmd!
    autocmd BufReadPost *.rs setlocal filetype=rust
augroup END

" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ }
let $RUST_BACKTRACE = 1
let g:LanguageClient_loggingLevel = 'INFO'
let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
