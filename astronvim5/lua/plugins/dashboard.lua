--- @type LazySpec
return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    if not opts.dashboard then return {} end

    vim.list_extend(opts.dashboard.preset.keys, {
      {
        key = "-",
        action = "<leader>-",
        desc = "Explorer",
        icon = " ",
      },
      {
        key = "g",
        action = "<leader>gg",
        desc = "Lazy git",
        icon = " ",
      },
      {
        key = "a",
        action = "<leader>oaa",
        desc = "Org Agenda",
        icon = " ",
      },
      { title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
    })
  end,
}
