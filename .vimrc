" Initialize Pathogen
execute pathogen#infect()

" colorscheme seagull " (OPTIONAL) Color scheme...

set nocp    " not vi-compatible, probably redundant with .vimrc?
set bs=indent,eol,start     " allow backspace to jump over these items
set ic      " ignore case
syntax on   " Syntax highlighting
filetype plugin indent on

" Force markdown highlighting for *.md
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Trim trailing whitespace on write.
function TrimWhiteSpace()
    " Save the last searched
    let _s = @/
    " Save the current cursor position
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/ = _s
    call cursor(l, c)
endfunction
" Autotrim on write...
autocmd BufWritePre * call TrimWhiteSpace()
" Trailing dots showing whitespace
set list listchars=tab:»·,trail:·

let mapleader=","

" Search
set incsearch
set hlsearch
nnoremap <silent> <Leader><Leader> :noh<CR><Esc>

set wildmenu    " display autocomplete options in command menu

" Bind j and k to move by visual line if text is there
nnoremap j gj
nnoremap k gk

" Buffers
map <C-J> :bp<CR>
map <C-K> :bn<CR>
set hidden

" split line
nnoremap K i<CR><Esc>

" Folding
set foldmethod=indent
set foldlevel=99

" Center cursor
set so=999
set cursorline

" line columns and ruler
set number
set ruler

" indentation settings
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab " tab to spaces

" Commands to edit from current file
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
map ,v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" webpack watching
set backupcopy=yes

" clipboard
if $TMUX == ''
    set clipboard=unnamed
endif

" airline configurations
" ======================
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='dark'
set noshowmode " hide the default mode line
" let g:airline_powerline_fonts = 1 " (OPTIONAL) show powerline fonts
" Trimming some sections earlier so more of the file path can be shown
    " airline_section_b (hunks, branch)
    " airline_section_y (fileencoding, fileformat)
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 100,
    \ 'y': 120
    \ }
" Abbreviating the vim mode mapping in the bottom left corner
let g:airline_mode_map = {
    \ 'n'   : 'NOR',
    \ 'i'   : 'INS',
    \ 'v'   : 'VIS',
    \ 'V'   : 'VIS',
    \ '^V'  : 'VIS',
    \ }
"    \ '__'  : '-',
"    \ 'c'   : 'COM',
"    \ 's'   : 'SEL',
"    \ 'S'   : 'SEL',
"    \ '^S'  : 'SEL',

" FZF
" =========
map <C-T> :FZF<CR>
map <C-Y> :call fzf#run({'sink': 'e', 'dir': '<C-R>=expand("%:p:h") . "/" <CR>'})<CR>
map <C-P> :call fzf#run({'source': map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'), 'sink': 'e', 'down': '30%'})<CR>

" fzf.vim
" =======
map <Leader>/ :Ag<space>

" Indent line plugin ? - https://github.com/Yggdroot/indentLine
" ===========================================================

" vim-sexp
" ========
" nmap <LocalLeader>( <Plug>(sexp_round_head_wrap_list)
" nmap <LocalLeader>) <Plug>(sexp_round_tail_wrap_list)
" nmap <LocalLeader>e( <Plug>(sexp_round_head_wrap_element)
" nmap <LocalLeader>e) <Plug>(sexp_round_tail_wrap_element)
