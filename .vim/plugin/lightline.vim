let s:p = {'normal': {}}

let s:black = [ '#000000', 0 ]
let s:maroon = [ '#800000', 1 ]
let s:green = [ '#008000', 2 ]
let s:olive = [ '#808000', 3 ]
let s:navy = [ '#000080', 4 ]
let s:purple = [ '#800080', 5 ]
let s:teal = [ '#008080', 6 ]
let s:silver = [ '#c0c0c0', 7 ]
let s:gray = [ '#808080', 8]
let s:red = [ '#ff0000', 9 ]
let s:lime = [ '#00ff00', 10 ]
let s:yellow = [ '#ffff00', 11 ]
let s:blue = [ '#0000ff', 12 ]
let s:fuchsia = [ '#ff00ff', 13 ]
let s:aqua = [ '#00ffff', 14 ]
let s:white = [ '#ffffff', 15 ]

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [ [ s:black, s:blue ], [ s:silver, s:black ] ]
let s:p.normal.middle = [ [ s:silver, s:gray ] ]
let s:p.normal.right = [ [ s:black, s:blue ], [ s:white, s:gray ] ]
let s:p.normal.error = [ [ s:black, s:red ] ]
let s:p.normal.warning = [ [ s:black, s:yellow ] ]
let s:p.inactive.left =  [ [ s:silver, s:black ] ]
let s:p.inactive.middle = [ [ s:silver, s:gray ] ]
let s:p.inactive.right = [ [ s:white, s:black ], [ s:white, s:gray ] ]
let s:p.insert.left = [ [ s:white, s:green ], [ s:silver, s:black ] ]
let s:p.insert.right = copy(s:p.insert.left)
let s:p.replace.left = [ [ s:white, s:red ], [ s:silver, s:black ] ]
let s:p.replace.right = copy(s:p.replace.left)
let s:p.visual.left = [ [ s:white, s:purple ], [ s:silver, s:black ] ]
let s:p.visual.right = copy(s:p.visual.left)
let s:p.tabline.left = [ [ s:silver, s:black ] ]
let s:p.tabline.tabsel = copy(s:p.normal.right)
let s:p.tabline.middle = [ [ s:silver, s:black ] ]
let s:p.tabline.right = copy(s:p.normal.right)

let g:lightline#colorscheme#custom#palette = lightline#colorscheme#flatten(s:p)

let s:bracketSep =  ' 〉'

function! CodeInfo() abort
  let info = ale#statusline#Count(bufnr('%'))
  let msgs = []
  " if len(get(b:, 'coc_current_function', ''))
  "   call add(msgs, get(b:, 'coc_current_function', ''))
  " endif
  if get(info, 'error', 0)
    call add(msgs, '!' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, '?' . info['warning'])
  endif
  if len(get(g:, 'coc_status', ''))
    call add(msgs, get(g:, 'coc_status', ''))
  else
    call add(msgs, &ft)
  endif
  return join(msgs, s:bracketSep)
endfunction

function! NavFilename() abort
  if exists('b:coc_nav') && len(b:coc_nav)
    let nav_path = map(copy(b:coc_nav), 'v:val.name')
    call insert(nav_path, expand('%:t'), 0)
    return join(nav_path, s:bracketSep)
  else
    let fname = expand('%')
    return len(fname) ? fname : '[No Name]'
  endif
endfunction

let g:lightline = {
  \   'colorscheme': 'custom',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \               [ 'readonly', 'filename', 'modified' ] ],
  \     'right': [ [ 'percent', 'lineinfo' ], [ 'codeinfo', 'gitbranch' ] ]
  \   },
  \   'inactive': {
  \     'left': [ [ 'filename', 'modified' ] ],
  \     'right': [ [ 'lineinfo' ], [ 'percent' ] ] },
  \   'component': {
  \     'filename': '%<%{NavFilename()}',
  \     'gitbranch': '♆ %{FugitiveHead()}',
  \   },
  \   'component_function': {
  \     'codeinfo': 'CodeInfo'
  \   },
  \  }

let g:lightline.mode_map = {
      \ 'n': 'N',
      \ 'i': 'I',
      \ 'R': 'R',
      \ 'v': 'V',
      \ 'V': 'V'
      \ }

let g:lightline.subseparator = { 'left': '│', 'right': '│' }

set noshowmode
