return {
  {
    "AstroNvim/astrotheme",
    config = function()
      require("astrotheme").setup({})
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "astrotheme",
    },
  },
}
