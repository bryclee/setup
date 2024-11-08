---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.mappings["/"] = "noop"
    opts.filesystem.bind_to_cwd = false
  end,
}
