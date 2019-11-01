" highlight clear

" For reference - here are the colors we're working off of
"   NR-16   NR-8    COLOR NAME ~
"   0       0       Black
"   1       4       DarkBlue
"   2       2       DarkGreen
"   3       6       DarkCyan
"   4       1       DarkRed
"   5       5       DarkMagenta
"   6       3       Brown, DarkYellow
"   7       7       LightGray, LightGrey, Gray, Grey
"   8       0*      DarkGray, DarkGrey
"   9       4*      Blue, LightBlue
"   10      2*      Green, LightGreen
"   11      6*      Cyan, LightCyan
"   12      1*      Red, LightRed
"   13      5*      Magenta, LightMagenta
"   14      3*      Yellow, LightYellow
"   15      7*      White

let s:colors = {
      \ 'black': '0',
      \ 'darkRed': '1',
      \ 'darkGreen': '2',
      \ 'darkBrown': '3',
      \ 'darkBlue': '4',
      \ 'darkMagenta': '5',
      \ 'darkCyan': '6',
      \ 'darkGrey': '8',
      \ 'lightGrey': '7',
      \ 'red': '9',
      \ 'green': '10',
      \ 'yellow': '11',
      \ 'blue': '12',
      \ 'magenta': '13',
      \ 'cyan': '14',
      \ 'white': '15',
      \ 'none': 'none'
      \ }

if exists("syntax_on")
  syntax reset
endif

" Forked off of dim
let colors_name = "custom"

" Diff highlighting
highlight DiffAdd        ctermfg=0    ctermbg=10
highlight DiffChange     ctermfg=0    ctermbg=11
highlight DiffDelete     ctermfg=0    ctermbg=9
highlight DiffText       ctermfg=0    ctermbg=3     cterm=bold

" Invert selected lines in visual mode
highlight Visual         ctermfg=15 ctermbg=6

" Highlight search matches in black, with a yellow background
highlight Search         ctermfg=0    ctermbg=11

" Matching parens
highlight MatchParen    ctermfg=0 ctermbg=14

highlight StatusLine     cterm=bold,reverse
highlight StatusLineNC   cterm=underline

" Dim line numbers, comments, color columns, the status line, splits and sign
" columns.
if &background == "light"
  highlight LineNr       ctermfg=NONE
  highlight Comment      ctermfg=4                  cterm=italic
  highlight ColorColumn  ctermfg=8    ctermbg=7
  highlight Folded       ctermfg=8    ctermbg=7
  highlight FoldColumn   ctermfg=8    ctermbg=7
  highlight Pmenu        ctermfg=0    ctermbg=7
  highlight PmenuSel     ctermfg=7    ctermbg=0
  highlight SpellCap     ctermfg=8    ctermbg=7
  highlight SpellLocal   ctermfg=6                  cterm=inverse
  highlight VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
  highlight SignColumn                ctermbg=7

  highlight Type         cterm=bold,italic
  highlight Boolean      cterm=bold ctermfg=1
  highlight Identifier   cterm=bold
  highlight CursorLineNr cterm=reverse ctermfg=darkyellow
else
  highlight LineNr       ctermfg=NONE
  highlight Comment      ctermfg=12                 cterm=italic
  highlight ColorColumn  ctermfg=7    ctermbg=8
  highlight Folded       ctermfg=7    ctermbg=8
  highlight FoldColumn   ctermfg=7    ctermbg=8
  highlight Pmenu        ctermfg=15   ctermbg=8
  highlight PmenuSel     ctermfg=8    ctermbg=15
  highlight SpellCap     ctermfg=7    ctermbg=8
  highlight SpellLocal   ctermfg=6                  cterm=inverse
  highlight VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
  highlight SignColumn                ctermbg=8

  highlight Type         cterm=bold,italic
  highlight Boolean      cterm=bold ctermfg=9
  highlight Identifier   cterm=bold
  highlight CursorLineNr cterm=reverse ctermfg=yellow
endif

" Only highlight cursorline for current window
augroup CursorLineActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END
highlight CursorLineNr          cterm=reverse

highlight SpellBad term=standout cterm=underline ctermbg=none

" To allow italics in default vim
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Plugins
highlight GitGutterAdd      ctermfg=2    ctermbg=none
highlight GitGutterChange   ctermfg=3    ctermbg=none
highlight GitGutterDelete   ctermfg=1    ctermbg=none
highlight CocInfoSign       ctermfg=3
highlight CocInfoFloat      ctermfg=none

" Language specific options
highlight link graphqlConstant Type
