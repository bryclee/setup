if true then return {} end

---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = false,
    },
    window = {
      mappings = {
        -- ["/"] = "noop",
        -- ["f"] = "fuzzy_finder"
      },
    },
    filesystem = {
      bind_to_cwd = false,
      filtered_items = {
        visible = true,
      }
    },
  },
  specs = {
    {

      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>-"] = { "<Cmd>Neotree position=current reveal_force_cwd=true<CR>", desc = "Explorer in current buffer" },
            ["<Leader>be"] = { "<Cmd>Neotree source=buffers<CR>", desc = "Buffer explorer" },
            ["<Leader>ge"] = { "<Cmd>Neotree source=git_status<CR>", desc = "Git explorer" },
            ["<Leader>of"] = { "<Cmd>FzfLua files cwd=~/orgfiles<CR>", desc = "Find org files" },
            ["<Leader>e"] = {
              function()
                if vim.bo.filetype == "neo-tree" then
                  vim.cmd.wincmd "p"
                else
                  vim.cmd "Neotree focus reveal_force_cwd=true position=left"
                end
              end,
              desc = "Show/Focus explorer",
            },
          },
        },
      },
    },
  },
  -- opts = function(_, opts)
  --   opts.window.mappings["/"] = "noop"
  --
  --   opts.filesystem.cwd_target = opts.filesystem.cwd_target or {}
  --   opts.filesystem.cwd_target.current = "none"
  -- end,
}
