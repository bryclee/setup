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
        action = function() require("snacks").lazygit() end,
        desc = "Lazy git",
        icon = " ",
      },
      {
        key = "a",
        action = "<leader>oaa",
        desc = "Org Agenda",
        icon = " ",
      },
    })

    vim.list_extend(opts.dashboard.sections, {
      { title = "Recent Files", section = "recent_files", indent = 2, padding = { 1, 1 }, pane = 2 },
      { title = "Recent Projects", section = "projects", indent = 2, padding = { 1, 1 }, pane = 2 },
    })

    opts.dashboard.preset.header = 'AstroNvim'
  end,
}
