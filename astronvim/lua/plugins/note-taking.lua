return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      -- Setup orgmode
      require("orgmode").setup {
        org_agenda_files = "~/orgfiles/**/*",
        org_default_notes_file = "~/orgfiles/refile.org",
        org_hide_emphasis_markers = true,
      }

      -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
      -- add ~org~ to ignore_install
      -- require('nvim-treesitter.configs').setup({
      --   ensure_installed = 'all',
      --   ignore_install = { 'org' },
      -- })
    end,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = { "*" },
        callback = function() vim.cmd [[hi link @org.agenda.scheduled Comment]] end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        callback = function()
          -- Disable nvim-ufo, which conflicts with ufo folds
          -- if require("astrocore").is_available "ufo" then require("ufo").detach() end
          require("ufo").detach()

          vim.keymap.set({ "n", "i" }, "<M-CR>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
            silent = true,
            buffer = true,
            desc = "Org meta return",
          })
          vim.keymap.set(
            { "n", "i" },
            "<M-Left>",
            '<cmd>lua require("orgmode").action("org_mappings.do_promote")<CR>',
            {
              silent = true,
              buffer = true,
              desc = "Org promote",
            }
          )
          vim.keymap.set(
            { "n", "i" },
            "<M-Right>",
            '<cmd>lua require("orgmode").action("org_mappings.do_demote")<CR>',
            {
              silent = true,
              buffer = true,
              desc = "Org demote",
            }
          )
          vim.keymap.set(
            { "n", "i" },
            "<S-Right>",
            '<cmd>lua require("orgmode").action("org_mappings.todo_next_state")<CR>',
            {
              silent = true,
              buffer = true,
              desc = "Org cycle todo",
            }
          )
          vim.keymap.set(
            { "n", "i" },
            "<S-Left>",
            '<cmd>lua require("orgmode").action("org_mappings.todo_prev_state")<CR>',
            {
              silent = true,
              buffer = true,
              desc = "Org cycle todo previous",
            }
          )
        end,
      })
    end,
    specs = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          if not opts.ignore_install then opts.ignore_install = {} end

          -- Ignoring per the nvim-orgmode install instructions https://github.com/nvim-orgmode/orgmode
          vim.list_extend(opts.ignore_install, { "org" })
        end,
      },
    },
  },
  {
    "akinsho/org-bullets.nvim",
    opts = {
      -- concealcursor = true,
    },
  },
  -- ufo: conflict with orgmode folds, and I'm not sure how useful it is to keep
  {
    "kevinhwang91/nvim-ufo",
    enabled = true,
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>oe"] = { "<Cmd>bot sp ~/orgfiles<CR>", desc = "Explore orgfiles" },
        },
      },
    },
  },
}
