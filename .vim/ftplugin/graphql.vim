set linebreak

if exists('g:pear_tree_pairs')
  let b:pear_tree_pairs = extend(deepcopy(g:pear_tree_pairs), {
        \ '"""': { 'closer': '"""' }
        \ })
endif

setlocal path+=**/*.graphql
