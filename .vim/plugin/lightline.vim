let g:lightline = {
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
  \  }

set noshowmode
