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
"   13      5*      DarkMagenta, LightMagenta
"   14      3*      Yellow, LightYellow
"   15      7*      White

if exists("syntax_on")
  hi clear
  syntax reset
endif

" Generally, prefer to use dark colors and set terminal colors accordingly for
" light mode
set background=dark

" Forked off of dim, modified based off of https://github.com/sdras/night-owl-vscode-theme
let colors_name = "custom-nightowl"

" Diff highlighting
hi DiffAdd        ctermfg=none ctermbg=darkcyan
hi DiffChange     ctermfg=none ctermbg=darkyellow
hi DiffText       ctermfg=black ctermbg=darkyellow cterm=bold
hi DiffDelete     ctermfg=none ctermbg=magenta

" hi Visual         ctermfg=white ctermbg=darkcyan
hi Visual         cterm=standout ctermbg=none
" hi Search         ctermfg=black    ctermbg=yellow
" hi MatchParen     ctermfg=white ctermbg=darkcyan

" Dim line numbers, comments, color columns, the status line, splits and sign
" columns.
hi LineNr       ctermfg=8
hi ColorColumn  ctermfg=15    ctermbg=0
hi Folded       ctermfg=15    ctermbg=8
hi FoldColumn   ctermfg=15    ctermbg=8
hi Pmenu        ctermfg=none   ctermbg=0
hi PmenuSel     cterm=reverse ctermfg=none    ctermbg=0
hi SpellCap     ctermfg=15    ctermbg=8
hi SpellLocal   ctermfg=darkcyan                  cterm=inverse
hi VertSplit    ctermfg=NONE ctermbg=NONE  cterm=NONE
hi Folded       ctermbg=NONE
hi Conceal      ctermfg=8 ctermbg=0
hi clear SignColumn

hi Comment cterm=italic ctermfg=8
hi Error ctermfg=0 ctermbg=red
hi ErrorMsg ctermbg=none ctermfg=darkred cterm=standout
hi CursorLineNr cterm=bold ctermfg=yellow
hi StatusLine   cterm=bold,reverse ctermfg=blue ctermbg=none
hi StatusLineNC cterm=underline ctermfg=7 ctermbg=0
hi TabLine cterm=underline ctermfg=7 ctermbg=8
hi TabLineFill cterm=underline ctermbg=0
hi Directory cterm=bold ctermfg=blue

hi Special ctermfg=darkblue
hi Constant cterm=bold ctermfg=darkcyan
hi Statement ctermfg=darkred
hi Operator ctermfg=darkmagenta
hi Label ctermfg=darkcyan
hi KeyWord ctermfg=darkmagenta
hi Conditional  cterm=bold ctermfg=red
hi StorageClass cterm=bold ctermfg=darkmagenta
hi Type cterm=none ctermfg=darkblue
hi Identifier   cterm=none ctermfg=none
hi Boolean cterm=bold ctermfg=red
hi Function     cterm=none ctermfg=darkblue
hi Include cterm=bold ctermfg=darkblue
hi PreProc ctermfg=red
hi String ctermfg=red
hi Underlined cterm=underline ctermfg=cyan
hi Title cterm=bold ctermfg=darkmagenta
" hi Search ctermbg=yellow
hi CursorHold cterm=underline ctermbg=none
hi CursorColumn ctermbg=8

hi MoreMsg ctermfg=green
hi SpecialKey ctermfg=cyan
hi Question ctermfg=green
hi WarningMsg ctermfg=magenta

hi markdownCode ctermfg=yellow ctermbg=none

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
  hi link CocErrorFloat DiagnosticError
  hi link CocHighlightText CursorHold
  hi link CocFloating Pmenu
  hi link CocMenuSel PmenuSel
  hi link CocPumVirtualText Comment
  hi link FgCocErrorFloatBgCocFloating CocErrorFloat
  hi link FgCocInfoFloatBgCocFloating CocInfoFloat
  hi link FgCocWarnFloatBgCocFloating CocWarnFloat
  hi link CocListLine CursorLine

  hi DiagnosticVirtualTextError ctermfg=1 ctermbg=0
  hi DiagnosticVirtualTextWarn ctermfg=7 ctermbg=0
  hi DiagnosticVirtualTextInfo ctermfg=8
  hi DiagnosticVirtuaLTextHint ctermfg=8
  hi GitGutterAdd      ctermfg=darkgreen    ctermbg=none
  hi GitGutterChange   ctermfg=darkyellow    ctermbg=none
  hi GitGutterDelete   ctermfg=darkred    ctermbg=none
  hi clear htmlStrike
  hi link htmlStrike Conceal
endfun

augroup PluginHighlights
  autocmd!
  autocmd ColorScheme * call SetPluginHighlights()
augroup END

" Language specific options
hi link graphqlConstant Constant
hi link @string.documentation.graphql Comment
