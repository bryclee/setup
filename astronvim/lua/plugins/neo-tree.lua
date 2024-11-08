---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window.mappings["/"] = "noop"

    opts.filesystem.cwd_target = opts.filesystem.cwd_target or {}
    opts.filesystem.cwd_target.current = "none"
  end,
}
