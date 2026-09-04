-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- Core plugins: https://github.com/AstroNvim/AstroNvim/tree/main/lua%2Fastronvim%2Fplugins
-- Community plugins: https://github.com/AstroNvim/astrocommunity/

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  -- { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.motion.nvim-surround" }, -- for surround motions
  { import = "astrocommunity.markdown-and-latex/markdown-preview-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  {
    "echasnovski/mini.move",
    opts = {
      mappings = {
        left = "<A-Left>",
        right = "<A-Right>",
        down = "<A-Down>",
        up = "<A-Up>",
        line_left = "<A-Left>",
        line_right = "<A-Right>",
        line_down = "<A-Down>",
        line_up = "<A-Up>",
      },
    },
  },
  { import = "astrocommunity.file-explorer.mini-files" }, -- neo-tree isn't working well with large directories
  { import = "astrocommunity.ai.sidekick-nvim" },
  {
    "folke/sidekick.nvim",
    opts = {
      nes = {
        enabled = false,
      },
      cli = {
        tools = {
          antigravity = {
            cmd = { "agy" },
          },
        },
        mux = {
          create = "split",
        },
      },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>Ac"] = {
            function()
              local tool = (vim.fn.executable "claude" == 1 and "claude")
                or (vim.fn.executable "agy" == 1 and "antigravity")

              if tool then
                require("sidekick.cli").toggle { name = tool, focus = true }
              else
                vim.notify("Neither 'claude' nor 'agy' executable found in PATH", vim.log.levels.WARN)
              end
            end,
            desc = "Sidekick Toggle CLI (Claude -> AGY)",
          }
        end,
      },
    },
  },
}
