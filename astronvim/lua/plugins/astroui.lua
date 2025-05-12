-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
---@type LazySpec
return {
  {
    "AstroNvim/astrotheme",
    opts = {
      -- palette = "astromars",
      -- background = {
      --   light = "astrojupiter",
      --   dark = "astromars",
      -- },
      palettes = {
        astrolight = {
          ui = {
            inactive_base = "#ECEDED",
          },
        },
        astrojupiter = {
          ui = {
            -- #FEEEEE
            inactive_base = "#F8E2E2",
          },
        },
      },
      highlights = {
        astrodark = {
          DiffAdd = { bg = "#2a2544" },
          DiffDelete = { fg = "#654365", bg = "#231724" },
          DiffChange = { bg = "#3f3820" },
        },
        astrolight = {
          DiffAdd = { bg = "#e6f2f8" },
          DiffDelete = {
            fg = "#7a7aac",
            bg = "#d6e2e8",
          },
          DiffChange = { bg = "#f6daf8" },
        },
      },
    },
  },
  -- {
  --   "AstroNvim/astroui",
  --   ---@type AstroUIOpts
  --   opts = {
  --     -- change colorscheme
  --     colorscheme = "astrotheme",
  --     -- colorscheme = "rose-pine",
  --     -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
  --     highlights = {
  --       init = { -- this table overrides highlights in all themes
  --         -- Normal = { bg = "#000000" },
  --       },
  --       astrodark = { -- a table of overrides/changes when applying the astrotheme theme
  --         -- Normal = { bg = "#000000" },
  --       },
  --     },
  --     -- Icons can be configured throughout the interface
  --     -- icons = {
  --     --   -- configure the loading of the lsp in the status line
  --     --   LSPLoading1 = "⠋",
  --     --   LSPLoading2 = "⠙",
  --     --   LSPLoading3 = "⠹",
  --     --   LSPLoading4 = "⠸",
  --     --   LSPLoading5 = "⠼",
  --     --   LSPLoading6 = "⠴",
  --     --   LSPLoading7 = "⠦",
  --     --   LSPLoading8 = "⠧",
  --     --   LSPLoading9 = "⠇",
  --     --   LSPLoading10 = "⠏",
  --     -- },
  --   },
  -- },

  -- colorscheme
  -- { "AstroNvim/astroui", opts = { colorscheme = "astromars" } },
}
