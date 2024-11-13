---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.mappings["/"] = "noop"

    -- LazyVim has mappings for starting this from project directory, so we can give this a try
    -- opts.filesystem.bind_to_cwd = false
  end,
}
