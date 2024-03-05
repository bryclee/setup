require("nvim-treesitter.install").prefer_git = true
require('nvim-treesitter.configs').setup {
  prefer_git = true,
  -- indent = {
  --   enable = true
  -- },
  highlight = {
    enable = true
  },
  -- incremental_selection = {
  --   enable = true
  -- },
  -- textobjects = {
  --   enable = true
  -- },
}
