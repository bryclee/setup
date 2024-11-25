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
          vim.keymap.set("i", "<M-CR>", '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>', {
            silent = true,
            buffer = true,
            desc = "Org meta return",
          })
          vim.keymap.set("i", "<S-Left>", '<cmd>lua require("orgmode").action("org_mappings.do_promote")<CR>', {
            silent = true,
            buffer = true,
            desc = "Org promote",
          })
          vim.keymap.set("n", "<S-Left>", '<cmd>lua require("orgmode").action("org_mappings.do_promote")<CR>', {
            silent = true,
            buffer = true,
            desc = "Org promote",
          })
          vim.keymap.set("i", "<S-Right>", '<cmd>lua require("orgmode").action("org_mappings.do_demote")<CR>', {
            silent = true,
            buffer = true,
            desc = "Org demote",
          })
          vim.keymap.set("n", "<S-Right>", '<cmd>lua require("orgmode").action("org_mappings.do_demote")<CR>', {
            silent = true,
            buffer = true,
            desc = "Org demote",
          })
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
    opts = {},
  },
  -- ufo: conflict with orgmode folds, and I'm not sure how useful it is to keep
  {
    "kevinhwang91/nvim-ufo",
    enabled = false,
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
