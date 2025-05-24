local journalTreeType = "day"
local refileTreeType = "day"

return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/orgfiles/**/*",
      org_default_notes_file = "~/orgfiles/refile.org",
      org_todo_keywords = { "TODO(t)", "NEXT(n)", "WAITING(w)", "|", "DONE(d)", "CANCELED(c)" },
      -- org_hide_emphasis_markers = true,
      org_blank_before_new_entry = { heading = false, plain_list_item = false },
      org_agenda_span = "day",
      org_agenda_start_on_weekday = false,
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n  %u",
          datetree = { tree_type = refileTreeType },
        },
        j = {
          description = "Journal",
          template = {
            "**** %T %?"
          },
          target = "~/orgfiles/journal.org",
          datetree = { tree_type = journalTreeType },
        },
        s = {
          description = "Standup",
          template = {
            "**** %T Standup",
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
          datetree = { tree_type = journalTreeType },
        },
      },
      mappings = {
        agenda = {
          org_agenda_filter = '<localleader>f'
        },
        org = {
          org_cycle = '<Right>'
        }
      }
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
          vim.opt_local.conceallevel = 0 -- not pleased with the link conceals

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

          -- Disable indent guide
          vim.b.snacks_indent = false
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
