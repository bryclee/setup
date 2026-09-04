-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

-- OSX only, write format to clipboard as RTF
local function exportFormatToRtf(format)
  return [[pandoc -f ]]
    .. format
    .. [[ -t html | hexdump -ve '1/1 "\%.2x"' | xargs printf "set the clipboard to {text:\" \", «class HTML»:«data HTML\%s»}" | osascript -]]
end
local exportOrg = exportFormatToRtf "org"
local exportMarkdown = exportFormatToRtf "markdown"

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
          cmdheight = 1,
          showtabline = 1,

          conceallevel = 2,
          guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20",
          -- concealcursor = "n",

          clipboard = "",
        },
      },
      -- Mappings can be configured through AstroCore as well.
      -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
      mappings = {
        -- first key is the mode
        n = {
          ["<C-_>"] = { "<C-/>", remap = true },
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
          ["<C-f>"] = { function() vim.fn.system { "tmux", "neww", "tmux-s" } end },
          ["<Esc>"] = { "<cmd>nohlsearch<CR>" },
          ["<Leader>o"] = false,
          ["<Leader>q"] = { "<Cmd>close<CR>", desc = "Close window" },

          -- Personal mappings for Search
          ["<Leader>s"] = { desc = "Search" },
          ["<Leader>sf"] = { function() require("snacks").picker.files() end, desc = "Files" },
          ["<Leader>ss"] = { function() require("snacks").picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
          ["<Leader>sn"] = { function() require("snacks").picker.lsp_symbols() end, desc = "Document Symbols" },
          ["<Leader>st"] = { function() require("snacks").picker.grep() end, desc = "Text (grep)" },
          ["<Leader>s/"] = {
            function() require("snacks").picker.lines() end,
            desc = "Buffer",
          },
          ["<Leader>se"] = { "<Cmd>Neotree position=left<CR>", desc = "Open neotree" },
          ["<Leader>s<CR>"] = { function() require("snacks").picker.resume() end, desc = "Resume picker" },
          ["<Leader>s<C-n>"] = { function() require("snacks").picker.command_history() end, desc = "Search command history" },
          ["<Leader><Leader>"] = { function() require("snacks").picker.buffers() end, desc = "Open buffers" },

          ["<Leader>yo"] = { "<Cmd>w !" .. exportOrg .. "<CR>", desc = "Yank org buffer" },
          ["<Leader>ym"] = { "<Cmd>w !" .. exportMarkdown .. "<CR>", desc = "Yank markdown buffer" },
          ["<Leader>yy"] = {
            function()
              local file = vim.fn.expand("%:.")
              local line = vim.fn.line(".")
              local path = file .. "#L" .. line
              vim.fn.setreg("+", path)
              vim.notify("Yanked: " .. path)
            end,
            desc = "Yank file path with line number"
          },

          -- References
          -- ["grr"] = false,
          -- ["gra"] = false,
          -- ["grn"] = false,
          ["grr"] = { function() require("snacks").picker.lsp_references() end, desc = "Go to references" },

          -- Disable splits
          ["\\"] = { "," }, -- ',' is localleader, so use '\' instead to traverse back
          ["|"] = false,

          -- Fold helper, only show current fold, and also expand all folds under current
          ["zV"] = { "zMzvzczOzz", desc = "Focus current fold under cursor" },

          ["<Leader>gB"] = { function() require("gitsigns").blame() end, desc = "Git blame file (gitsigns)" },
        },
        t = {
          ["<C-_>"] = { "<C-/>", remap = true },
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
          ["<C-\\><C-\\>"] = { [[<C-\><C-n>]], desc = "Return to Normal Mode" },
        },
        v = {
          ["<Leader>st"] = {
            function() require("snacks").picker.grep_word() end,
            desc = "Grep visual selection in project",
          },
          ["<Leader>yo"] = { ":w !" .. exportOrg .. "<CR>", desc = "Yank org selection" },
          ["<Leader>ym"] = { ":w !" .. exportMarkdown .. "<CR>", desc = "Yank markdown selection" },
          ["<Leader>yy"] = {
            function()
              local file = vim.fn.expand("%:.")
              local region = vim.fn.getregionpos(vim.fn.getpos("v"), vim.fn.getpos("."))
              local start_line = region[1][1][2]
              local end_line = region[#region][1][2]
              local path = file .. "#L" .. start_line .. "-L" .. end_line
              vim.fn.setreg("+", path)
              vim.notify("Yanked: " .. path)
            end,
            desc = "Yank file path with line range",
          },
        },
      },

      on_keys = {
        auto_hlsearch = false,
      },
      autocmds = {
        -- Stores the view of each file. This did not work very well with nvim-ufo, but this may work better with v5
        -- autoview = false,
        -- persistent_astroui_foldexpr = false,
        -- file_user_events = false
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
