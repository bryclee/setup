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
          -- concealcursor = "n",
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
          ["<Leader>q"] = { "<Cmd>close<CR>", desc = "Close window" },

          -- Personal mappings for Search
          ["<Leader>s"] = { desc = "Search" },
          ["<Leader>sf"] = { "<Cmd>FzfLua files<CR>", desc = "Files" },
          ["<Leader>ss"] = { "<Cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Workspace Symbols" },
          ["<Leader>sn"] = { "<Cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols" },
          ["<Leader>st"] = { "<Cmd>FzfLua grep_project<CR>", desc = "Text (grep)" },
          ["<Leader>s/"] = { "<Cmd>FzfLua blines<CR>", desc = "Buffer" },
          ["<Leader>se"] = { "<Cmd>Neotree position=left<CR>", desc = "Open neotree"},
          ["<Leader>s<CR>"] = { "<Cmd>FzfLua resume<CR>", desc = "Resume fzf picker"},
          ["<Leader>s:"] = { "<Cmd>FzfLua command_history<CR>", desc = "Search command history" },
          ["<Leader><Leader>"] = { "<Cmd>FzfLua buffers<CR>", desc = "Open buffers" },

          -- References
          ["grr"] = false,
          ["gra"] = false,
          ["grn"] = false,
          ["gr"] = { "<Cmd>FzfLua lsp_references<CR>", desc = "Go to references" },
        },
        t = {
          ["<C-_>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
          ["<C-\\><C-\\>"] = { [[<C-\><C-n>]], desc = "Return to Normal Mode" },
        },
        v = {
          ["<Leader>st"] = {
            function() require("fzf-lua").grep_visual() end,
            desc = "Grep visual selection in project",
          },
        },
      },

      on_keys = {
        auto_hlsearch = false,
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      formatting = {
        format_on_save = false,
      },
    },
  },
}
