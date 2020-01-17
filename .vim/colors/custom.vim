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

if exists("syntax_on")
  hi clear
  syntax reset
endif

" Forked off of dim
let colors_name = "custom"

" Diff highlighting
hi DiffAdd        ctermfg=black ctermbg=green
hi DiffChange     ctermfg=black ctermbg=lightyellow
hi DiffDelete     ctermfg=black ctermbg=red
hi DiffText       ctermfg=black ctermbg=yellow cterm=bold

" Invert selected lines in visual mode
hi Visual         ctermfg=white ctermbg=darkcyan

" hi search matches in black, with a yellow background
hi Search         ctermfg=black    ctermbg=yellow

" Matching parens
hi MatchParen    ctermfg=black ctermbg=lightcyan

" Dim line numbers, comments, color columns, the status line, splits and sign
" columns.
if &background == "light"
  hi LineNr       ctermfg=gray
  hi Comment      ctermfg=gray cterm=italic
  hi ColorColumn  ctermfg=darkgray    ctermbg=gray
  hi Folded       ctermfg=darkgray    ctermbg=gray
  hi FoldColumn   ctermfg=darkgray    ctermbg=gray
  hi Pmenu        ctermfg=black    ctermbg=gray
  hi PmenuSel     ctermfg=lightgray    ctermbg=black
  hi SpellCap     ctermfg=darkgray    ctermbg=gray
  hi SpellLocal   ctermfg=darkcyan                  cterm=inverse
  hi VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
  hi SignColumn                ctermbg=lightgray

  hi Type         cterm=bold,italic
  hi Boolean      cterm=bold ctermfg=darkred
  hi Identifier   cterm=bold

  hi CursorLineNr cterm=none ctermfg=darkyellow
  hi StatusLine   cterm=bold ctermfg=black ctermbg=cyan
  hi StatusLineNC cterm=none ctermfg=black ctermbg=gray
  hi Directory cterm=bold ctermfg=darkblue
else
  hi LineNr       ctermfg=darkgray
  hi Comment      ctermfg=gray                 cterm=italic
  hi ColorColumn  ctermfg=lightgray    ctermbg=darkgray
  hi Folded       ctermfg=lightgray    ctermbg=darkgray
  hi FoldColumn   ctermfg=lightgray    ctermbg=darkgray
  hi Pmenu        ctermfg=lightgray   ctermbg=darkgray
  hi PmenuSel     ctermfg=darkgray    ctermbg=white
  hi SpellCap     ctermfg=lightgray    ctermbg=darkgray
  hi SpellLocal   ctermfg=darkcyan                  cterm=inverse
  hi VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
  hi SignColumn                ctermbg=darkgray

  hi Type         cterm=bold,italic
  hi Boolean      cterm=bold ctermfg=lightred
  hi Identifier   cterm=bold

  hi CursorLineNr cterm=none ctermfg=yellow
  hi StatusLine   cterm=bold ctermfg=black ctermbg=lightcyan
  hi StatusLineNC cterm=none ctermfg=white ctermbg=darkgray
  hi Directory cterm=bold ctermfg=lightblue
endif

" Only hi cursorline for current window
augroup CursorLineActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

hi SpellBad term=standout cterm=underline ctermbg=none

" To allow italics in default vim
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Plugins
hi GitGutterAdd      ctermfg=darkgreen    ctermbg=none
hi GitGutterChange   ctermfg=darkyellow    ctermbg=none
hi GitGutterDelete   ctermfg=darkred    ctermbg=none
hi CocInfoSign       ctermfg=brown
hi CocInfoFloat      ctermfg=none

" Language specific options
hi link graphqlConstant Type
hi markdownCode ctermfg=red
hi markdownH1 cterm=bold
hi markdownH2 cterm=bold
hi markdownH3 cterm=none
hi markdownH4 cterm=none
hi markdownH5 cterm=none
