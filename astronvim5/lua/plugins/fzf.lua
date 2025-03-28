return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      backdrop = 100,
      preview = {
        -- flip_columns = 140,
        layout = "vertical",
      },
    },
    keymap = {
      builtin = {
        true,
        ["<S-Left>"] = "backward-word",
        ["<S-Right>"] = "forward-word",
      },
      fzf = {
        true,
      },
    },
    oldfiles = {
      include_current_session = true,
    },
  },
  specs = {
    {
      "AstroNvim/astrolsp",
      optional = true,
      opts = function(_, opts)
        if require("astrocore").is_available "fzf-lua" then
          local maps = opts.mappings
          maps.n["<Leader>lG"][1] = function() require("fzf-lua").lsp_live_workspace_symbols() end
          -- Move Hover Diagnostics from `gl` to `gh`
          maps.n["gh"] = maps.n["gh"]
          maps.n["gl"] = nil
        end
      end,
    },
  },
  dependencies = {
    {
      "AstroNvim/astrocore",
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>f/"][1] = function() require("fzf-lua").grep_curbuf() end
        maps.n["<Leader>fw"][1] = function() require("fzf-lua").grep_project() end
      end,
    },
  },
}
