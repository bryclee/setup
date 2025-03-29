--- @type LazySpec
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    if not opts.dashboard then return {} end

    table.insert(opts.dashboard.preset.keys, {
      key = "-",
      action = "<leader>-",
      desc = "Explorer",
      icon = " "
    })
  end,
}
