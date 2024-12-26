-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "astrodark",
    -- colorscheme = "rose-pine",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Normal = { bg = "#000000" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        -- Normal = { bg = "#000000" },
        DiffAdd = { bg = '#2a2544' },
        DiffDelete = { fg = '#654365', bg = '#231724'}
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },

  -- colorscheme
  -- { import = "astrocommunity.colorscheme.rose-pine" },
  -- { "rose-pine/neovim", opts = { dim_inactive_windows = true } },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- {
  --   "catppuccin/nvim",
  --   opts = {
  --     dim_inactive = {
  --       enabled = true, -- dims the background color of inactive window
  --       -- shade = "dark",
  --       -- percentage = 0.15, -- percentage of the shade to apply to the inactive window
  --     },
  --   },
  -- },
  -- { "AstroNvim/astroui", opts = { colorscheme = "catppuccin" } },
}
