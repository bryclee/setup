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
hi DiffText       ctermfg=black ctermbg=yellow cterm=bold
hi DiffDelete     ctermfg=black ctermbg=red

hi Visual         ctermfg=white ctermbg=darkcyan
hi Search         ctermfg=black    ctermbg=yellow
hi MatchParen    ctermfg=white ctermbg=darkcyan

" Dim line numbers, comments, color columns, the status line, splits and sign
" columns.
if &background == "light"
  hi LineNr       ctermfg=gray
  hi ColorColumn  ctermfg=darkgray    ctermbg=gray
  hi Folded       ctermfg=darkgray    ctermbg=gray
  hi FoldColumn   ctermfg=darkgray    ctermbg=gray
  hi Pmenu        ctermfg=black    ctermbg=lightgray
  hi PmenuSel     ctermfg=lightgray    ctermbg=black
  hi SpellCap     ctermfg=darkgray    ctermbg=gray
  hi SpellLocal   ctermfg=darkcyan                  cterm=inverse
  hi VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
  hi Folded       ctermbg=NONE
  hi clear SignColumn

  hi Comment cterm=italic ctermfg=gray
  hi Error ctermfg=red ctermbg=lightred
  hi CursorLineNr cterm=bold ctermfg=darkyellow
  hi StatusLine   cterm=bold ctermfg=white ctermbg=darkblue
  hi StatusLineNC cterm=none ctermfg=black ctermbg=gray
  hi TabLine cterm=none ctermbg=gray
  hi TabLineFill cterm=none ctermbg=darkblue
  hi Directory cterm=bold ctermfg=darkblue

  hi Special ctermfg=darkred
  hi Constant cterm=bold ctermfg=darkgreen
  hi Statement ctermfg=red
  hi Operator ctermfg=darkblue
  hi Label ctermfg=darkblue
  hi KeyWord ctermfg=darkblue
  hi Conditional  cterm=bold ctermfg=darkred
  hi StorageClass cterm=bold ctermfg=darkblue
  hi Type cterm=bold ctermfg=darkmagenta
  hi Identifier   cterm=none ctermfg=darkblue
  hi Boolean cterm=bold ctermfg=darkgreen
  hi Function     cterm=none
  hi Include cterm=bold ctermfg=darkred
  hi PreProc ctermfg=darkred
  hi String ctermfg=darkgreen
  hi Underlined cterm=underline ctermfg=darkblue
  hi Title cterm=bold ctermfg=darkmagenta

  hi markdownCode ctermfg=red ctermbg=none
else
  hi LineNr       ctermfg=darkgray
  hi ColorColumn  ctermfg=lightgray    ctermbg=darkgray
  hi Folded       ctermfg=lightgray    ctermbg=darkgray
  hi FoldColumn   ctermfg=lightgray    ctermbg=darkgray
  hi Pmenu        ctermfg=lightgray   ctermbg=darkgray
  hi PmenuSel     ctermfg=darkgray    ctermbg=white
  hi SpellCap     ctermfg=lightgray    ctermbg=darkgray
  hi SpellLocal   ctermfg=darkcyan                  cterm=inverse
  hi VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
  hi Folded       ctermbg=NONE
  hi clear SignColumn

  hi Comment cterm=italic ctermfg=gray
  hi Error ctermfg=lightred ctermbg=darkmagenta
  hi CursorLineNr cterm=bold ctermfg=yellow
  hi StatusLine   cterm=bold ctermfg=black ctermbg=lightblue
  hi StatusLineNC cterm=none ctermfg=white ctermbg=darkgray
  hi TabLine cterm=none ctermbg=darkgray
  hi TabLineFill cterm=none ctermbg=white
  hi Directory cterm=bold ctermfg=lightblue

  hi Special ctermfg=lightyellow
  hi Constant cterm=none ctermfg=lightmagenta
  hi Statement ctermfg=yellow
  hi Operator ctermfg=cyan
  hi Label ctermfg=cyan
  hi KeyWord ctermfg=cyan
  hi Conditional  cterm=bold ctermfg=yellow
  hi StorageClass cterm=bold ctermfg=cyan
  hi Type cterm=bold ctermfg=lightgreen
  hi Identifier   cterm=none ctermfg=cyan
  hi Boolean cterm=bold ctermfg=lightmagenta
  hi Function     cterm=none
  hi Include cterm=bold ctermfg=lightyellow
  hi PreProc ctermfg=lightyellow
  hi String cterm=none ctermfg=lightmagenta
  hi Underlined cterm=underline ctermfg=cyan
  hi Title cterm=bold ctermfg=lightgreen

  hi markdownCode ctermfg=yellow ctermbg=none
endif

" Only hi cursorline for current window
" augroup CursorLineActiveWindow
"   autocmd!
"   autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   autocmd WinLeave * setlocal nocursorline
" augroup END

" if &t_Co >= 256
"   if &background == "light"
"     hi CursorLine cterm=none ctermbg=254
"   else
"     hi CursorLine cterm=none ctermbg=237
"   endif
" endif

hi SpellBad term=standout cterm=underline ctermbg=none

" To allow italics in default vim
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" Plugins
function! SetPluginHighlights()
  hi link CocInfoSign MoreMsg
  hi link CocWarningSign WarningMsg
  hi link CocErrorSign Error
  hi link AleErrorSign ErrorMsg
  hi GitGutterAdd      ctermfg=darkgreen    ctermbg=none
  hi GitGutterChange   ctermfg=darkyellow    ctermbg=none
  hi GitGutterDelete   ctermfg=darkred    ctermbg=none
endfun

augroup PluginHighlights
  autocmd!
  autocmd ColorScheme * call SetPluginHighlights()
augroup END

" Language specific options
hi link graphqlConstant Constant
