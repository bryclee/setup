" Initialize Pathogen
execute pathogen#infect()

colorscheme seagull

set nocp
set bs=indent,eol,start
set ic " ignore case
syntax on
filetype plugin indent on

" Force markdown highlighting for *.md
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Search
set incsearch
set hlsearch
nnoremap <silent> \\ :noh<CR><Esc>

" Buffers
map <C-j> :bp<CR>
map <C-k> :bn<CR>
set hidden

" split line
nnoremap K i<CR><Esc>

" Folding
set foldmethod=indent
set foldlevel=99

" Center cursor
set so=999

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
let g:airline_powerline_fonts = 1

" FZF
" =========
map <C-T> :FZF<CR>
map <C-Y> :call fzf#run({'sink': 'e', 'dir': '<C-R>=expand("%:p:h") . "/" <CR>'})<CR>
map <C-P> :call fzf#run({'source': map(range(1, bufnr('$')), 'bufname(v:val)'), 'sink': 'e', 'down': '30%'})<CR>
