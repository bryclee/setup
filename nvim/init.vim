set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath =&runtimepath
source ~/.vim/vimrc

" set guicursor=
set inccommand=split " Live preview substitute command results
" set fillchars=vert:\|

" Start terminal mode on opening a terminal window
autocmd TermOpen * startinsert

lua require('plugin-treesitter')
" lua require('plugin-telescope')
" lua require('plugin-lsp')
lua require('keymaps')
lua require('plugin-harpoon')
" lua require('plugin-highlight-colors')
