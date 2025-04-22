return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
      org_todo_keywords = { "TODO(t)", "NEXT(n)", "WAITING(w)", "|", "DONE(d)", "CANCELED(c)" },
      org_hide_emphasis_markers = true,
      org_blank_before_new_entry = { heading = false, plain_list_item = false },
      org_agenda_span = "day",
      org_capture_templates = {
        n = {
          description = "Note",
          template = "* %<%H:%M> %?\n  %u",
        },
        j = {
          description = "Journal",
          template = {
            "**** %U %?",
          },
          target = "~/orgfiles/journal.org",
          datetree = { tree_type = 'month' },
        },
        s = {
          description = "Standup",
          template = {
            "**** %u Standup",
            "    - Previous day",
            "      - %?",
            "    - Today",
            "      - ",
            "    - Unexpected",
            "      - ",
            "    - Blockers",
            "      - ",
            "    - Spillover",
            "      - ",
          },
          target = "~/orgfiles/journal.org",
          datetree = { tree_type = 'month' },
        },
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = { "*" },
        callback = function() vim.cmd [[hi link @org.agenda.scheduled Comment]] end,
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "org",
        callback = function()
          vim.opt.wrap = true

          local orgMappings = {
            ["<M-CR>"] = {
              '<cmd>lua require("orgmode").action("org_mappings.meta_return")<CR>',
              desc = "Org meta return",
            },
            ["<M-Left>"] = {
              '<cmd>lua require("orgmode").action("org_mappings.do_promote")<CR>',
              desc = "Org promote",
            },
            ["<M-Right>"] = {
              '<cmd>lua require("orgmode").action("org_mappings.do_demote")<CR>',
              desc = "Org demote",
            },
            ["<S-Right>"] = {
              '<cmd>lua require("orgmode").action("org_mappings.todo_next_state")<CR>',
              desc = "Org cycle todo",
            },
            ["<S-Left>"] = {
              '<cmd>lua require("orgmode").action("org_mappings.todo_prev_state")<CR>',
              desc = "Org cycle todo previous",
            },
          }

          require("astrocore").set_mappings({
            n = orgMappings,
            i = orgMappings,
          }, { silent = true, buffer = true })
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
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>o"] = { desc = "Orgmode" },
          ["<Leader>of"] = { "<Cmd>FzfLua files cwd=~/orgfiles<CR>", desc = "Find org files" },
          ["<Leader>oh"] = { ":FzfLua live_grep cwd=~/orgfiles<CR>^\\*<C-g>", desc = "Search org headings" },
        },
      },
    },
  },
  -- {
  --   dir = "~/Projects/fzf-lua-orgmode.nvim",
  --   opts = {},
  --   event = "VeryLazy",
  --   dependencies = {
  --     { "nvim-orgmode/orgmode" },
  --   },
  -- },
}
