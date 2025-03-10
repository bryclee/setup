return {
  "hrsh7th/nvim-cmp",
  opts = function(_, opts)
    local cmp = require('cmp')
    opts.sources = {
      { name = "nvim_lsp", priority = 1000 },
      { name = "luasnip", priority = 750 },
      { name = "buffer", priority = 500 },
      { name = "path", priority = 250 },
      { name = "orgmode" }
    }
  end,
}
