-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  {
    -- https://github.com/AstroNvim/astrocore
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      -- vim options can be configured here
      options = {
        opt = { -- vim.opt.<key>
          wildmode = "longest:full",
          relativenumber = false,
          colorcolumn = "121",
          scrolloff = 3,
          smartcase = false,
          -- cmdheight = 1

          conceallevel = 2,
          concealcursor = "n",
        },
      },
      -- Mappings can be configured through AstroCore as well.
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        n = {
          ["<C-_>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
          ["<C-f>"] = { function() vim.fn.system { "tmux", "neww", "tmux-s" } end },
          ["<Esc>"] = { "<cmd>nohlsearch<CR>" },
          ["<Leader>o"] = false,
        },
        t = {
          ["<C-_>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
          ["<C-\\><C-\\>"] = { [[<C-\><C-n>]], desc = "Return to Normal Mode" },
        },
      },

      on_keys = {
        auto_hlsearch = false,
      },
    },
  },
}
