set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath =&runtimepath
source ~/.vim/vimrc

" Live preview substitute command results
set inccommand=split

" Disable guicursor, which shows the cursor as a bar in insert mode
" set guicursor=
set fillchars=vert:\|

" Start terminal mode on opening a terminal window
autocmd TermOpen * startinsert

lua <<EOF
require'nvim-treesitter.configs'.setup {
  indent = {
    enable = true
  },
  highlight = {
    enable = true
  },
  incremental_selection = {
    enable = true
  },
  textobjects = {
    enable = true
  },
}
EOF
