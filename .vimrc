" Initialize Pathogen plugins
execute pathogen#interpose('bundle/fzf')
execute pathogen#interpose('bundle/fzf.vim')
execute pathogen#interpose('bundle/gundo')
execute pathogen#interpose('bundle/vim-airline')
execute pathogen#interpose('bundle/vim-coloresque')
execute pathogen#interpose('bundle/vim-fireplace')
execute pathogen#interpose('bundle/vim-fugitive')
execute pathogen#interpose('bundle/vim-gitgutter')
execute pathogen#interpose('bundle/vim-javascript')
execute pathogen#interpose('bundle/vim-json')
execute pathogen#interpose('bundle/vim-less')
execute pathogen#interpose('bundle/vim-sleuth')
execute pathogen#interpose('bundle/pig.vim')

set nocp    " not vi-compatible, probably redundant with .vimrc?
set bs=indent,eol,start     " allow backspace to jump over these items
set ic      " ignore case
syntax on   " Syntax highlighting
filetype plugin indent on

set path+=**    " improve find

" enable mouse
set mouse=a

" Set the leader key
let mapleader=','

" Move file directories away from local directory
" The trailing // is to use absolute path
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//

" Read if file has changed from outside vim
set autoread

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
" autocmd BufWritePre * call TrimWhiteSpace()
nnoremap <leader>w :call TrimWhiteSpace()<CR>:w<CR>
" Trailing dots showing whitespace
set list
set listchars=tab:\|\ ,trail:·

" Function for toggling a property
" Usage: NMapToggle <keybinding> <string property name>
function NMapToggle(key, opt)
    " Create chained command string, toggle property and get value of property
    let cmd = ':set '.a:opt.'! \| set '.a:opt."?\<CR>"
    " nnoremap with new cmd
    exec 'nnoremap '.a:key.' '.cmd
endfunction
" Apply variable number of args to NMapToggle?
command -nargs=+ NMapToggle call NMapToggle(<f-args>)

" paste mode
" paste command. only works with pbpaste (OSX)
nnoremap <silent> <leader>p :r !pbpaste<CR>
" nnoremap <silent> <leader>p :set paste!<CR>

" Search
set incsearch
set hlsearch
nnoremap <silent> <Leader><Leader> :noh<CR><Esc>

" Autocomplete
set wildmenu    " display autocomplete options in command menu
set complete=.,b,u,] " Autocomplete sources
set wildmode=longest,list:longest " Set autocomplete default replacement behavior
set completeopt=menu,preview " How menu shows

" Bind j and k to move by visual line if text is there
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

" Buffers
nnoremap <C-J> :bp<CR>
nnoremap <C-K> :bn<CR>
nnoremap <leader>d :b# <BAR> bd #<CR> " In case you want to leave the window
set hidden

" Using splits
set splitbelow
set splitright

" split line
nnoremap K i<CR><Esc>

" Folding
set foldmethod=indent
set foldlevel=99

" Center cursor
set scrolloff=5

" line columns and ruler
set number
set numberwidth=4
set ruler
" Add column marker at 81 chars
set colorcolumn=81

" indentation settings
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab " tab to spaces

" netrw settings
" ==============
" let g:netrw_browse_split = 4 " Open the file when hitting <CR> in the original window
let g:netrw_banner = 0
function! ToggleVExplorer()
    if exists("t:expl_buf_num")
        let expl_win_num = bufwinnr(t:expl_buf_num)
        if expl_win_num != -1
            let cur_win_nr = winnr()
            exec expl_win_num . 'wincmd w'
            close
            exec cur_win_nr . 'wincmd w'
            unlet t:expl_buf_num
        else
            unlet t:expl_buf_num
        endif
    else
        exec '1wincmd w'
        Vexplore
        let t:expl_buf_num = bufnr("%")
    endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>

" Commands to edit from current file
map <leader>e :e <C-R>=expand("%:p:h") . "/" <CR>
map <leader>t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map <leader>s :split <C-R>=expand("%:p:h") . "/" <CR>
map <leader>v :vsplit <C-R>=expand("%:p:h") . "/" <CR>

" webpack watching
set backupcopy=yes

" airline configurations
" ======================
set laststatus=2
set t_Co=256
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_theme='dark'
set noshowmode " hide the default mode line
let g:airline_powerline_fonts = 1 " (OPTIONAL) show powerline fonts
" Trimming some sections earlier so more of the file path can be shown
    " airline_section_b (hunks, branch)
    " airline_section_y (fileencoding, fileformat)
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 110,
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

" FZF.vim
" =======
function! s:ag_with_opts(arg, bang)
    let tokens = split(a:arg)
    let ag_opts = join(filter(copy(tokens), 'v:val =~ "^-"'))
    let query = join(filter(copy(tokens), 'v:val !~ "^-"'))
    call fzf#vim#ag(query, ag_opts, a:bang ? {} : {'down': '4o%'})
endfunction

autocmd VimEnter * command! -nargs=* -bang Ag call s:ag_with_opts(<q-args>, <bang>0)

" Indent line plugin ? - https://github.com/Yggdroot/indentLine
" ===========================================================

" vim-sexp
" ========
" nmap <LocalLeader>( <Plug>(sexp_round_head_wrap_list)
" nmap <LocalLeader>) <Plug>(sexp_round_tail_wrap_list)
" nmap <LocalLeader>e( <Plug>(sexp_round_head_wrap_element)
" nmap <LocalLeader>e) <Plug>(sexp_round_tail_wrap_element)

" editorconfig-vim
" ================
" let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" gundo.vim
" =========
nnoremap <leader>u :GundoToggle<CR>

" vim-json
if isdirectory(expand("~/.vim/bundle/vim-json"))
    let g:vim_json_syntax_conceal = 0
endif
