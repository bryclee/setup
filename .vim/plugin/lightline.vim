let g:lightline = {
  \   'colorscheme': '16color',
  \   'active': {
  \     'left': [ [ 'mode', 'paste' ],
  \               [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
  \     'right': [ [ 'percent', 'lineinfo' ], [ 'filetype' ] ]
  \   },
  \   'component': {
  \     'filename': '%<%f'
  \   },
  \   'component_function': {
  \     'gitbranch': 'FugitiveHead'
  \   },
  \   'enable': {
  \     'statusline': 1,
  \     'tabline': 0,
  \   }
  \  }

set noshowmode
