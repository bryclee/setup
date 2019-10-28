set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath =&runtimepath
source ~/.vim/vimrc

" Live preview substitute command results
set inccommand=split

" Disable guicursor, which shows the cursor as a bar in insert mode
" set guicursor=

set fillchars=vert:\|
