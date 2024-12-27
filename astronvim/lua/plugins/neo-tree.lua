---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    source_selector = {
      winbar = false,
    },
    window = {
      mappings = {
        ["/"] = "noop",
      },
    },
    filesystem = {
      bind_to_cwd = false,
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
            ["<Leader>e"] = {
              function()
                if vim.bo.filetype == "neo-tree" then
                  vim.cmd.wincmd "p"
                else
                  vim.cmd.Neotree "focus"
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
