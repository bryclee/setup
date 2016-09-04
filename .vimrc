set nocp
set bs=2

set ic
set number
set ruler

set tabstop=4
set shiftwidth=4
set autoindent
set expandtab

" Commands to edit from current file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" This fixes an issue with vim interferes with webpack watching files, see webpack troubleshooting docs
set backupcopy=yes

