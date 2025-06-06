-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

local function currentWindowOpts()
  local win = vim.fn.win_screenpos(0)
  local row = win[1]
  local col = win[2]
  local width = vim.fn.winwidth(0)
  local height = vim.fn.winheight(0)

  if row == 1 then
    row = 0
    height = height - 1
  end

  if col == 1 then
    col = 0
    width = width - 1
  else
    width = width - 2
  end

  return {
    row = row,
    col = col,
    width = width,
    height = height,
  }
end

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
          ["<Leader>sf"] = { "<Cmd>FzfLua files<CR>", desc = "Files" },
          ["<Leader>ss"] = { "<Cmd>FzfLua lsp_live_workspace_symbols<CR>", desc = "Workspace Symbols" },
          ["<Leader>sn"] = { "<Cmd>FzfLua lsp_document_symbols<CR>", desc = "Document Symbols" },
          ["<Leader>st"] = { "<Cmd>FzfLua grep_project<CR>", desc = "Text (grep)" },
          ["<Leader>s/"] = {
            function()
              require("fzf-lua").blines {
                winopts = currentWindowOpts(),
              }
            end,
            desc = "Buffer",
          },
          ["<Leader>se"] = { "<Cmd>Neotree position=left<CR>", desc = "Open neotree" },
          ["<Leader>s<CR>"] = { "<Cmd>FzfLua resume<CR>", desc = "Resume fzf picker" },
          ["<Leader>s<C-n>"] = { "<Cmd>FzfLua command_history<CR>", desc = "Search command history" },
          ["<Leader><Leader>"] = { "<Cmd>FzfLua buffers<CR>", desc = "Open buffers" },

          ["<Leader>yo"] = { "<Cmd>w !" .. exportOrg .. "<CR>", desc = "Yank org buffer" },
          ["<Leader>ym"] = { "<Cmd>w !" .. exportMarkdown .. "<CR>", desc = "Yank markdown buffer" },

          -- References
          -- ["grr"] = false,
          -- ["gra"] = false,
          -- ["grn"] = false,
          ["grr"] = { "<Cmd>FzfLua lsp_references<CR>", desc = "Go to references" },

          -- Disable splits
          ["\\"] = { "," }, -- ',' is localleader, so use '\' instead to traverse back
          ["|"] = false,

          -- Fold helper, only show current fold, and also expand all folds under current
          ["zV"] = { "zMzvzczOzz", desc = "Focus current fold under cursor" },
        },
        t = {
          ["<C-_>"] = { "<C-/>", remap = true },
          ["<C-/>"] = { "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm" },
          ["<C-\\><C-\\>"] = { [[<C-\><C-n>]], desc = "Return to Normal Mode" },
        },
        v = {
          ["<Leader>st"] = {
            function() require("fzf-lua").grep_visual() end,
            desc = "Grep visual selection in project",
          },
          ["<Leader>yo"] = { ":w !" .. exportOrg .. "<CR>", desc = "Yank org selection" },
          ["<Leader>ym"] = { ":w !" .. exportMarkdown .. "<CR>", desc = "Yank markdown selection" },
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
