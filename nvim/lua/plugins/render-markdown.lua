---@type LazySpec
return {
  "MeanderingProgrammer/render-markdown.nvim",
  optional = true,
  opts = {
    file_types = { "markdown", "octo" },
    heading = {
      -- Nerd Font glyphs when icons are enabled, plain unicode otherwise.
      icons = function(ctx)
        local nerd = { "󰉫 ", "󰉬 ", "󰉭 ", "󰉮 ", "󰉯 ", "󰉰 " }
        local plain = { "◉ ", "○ ", "✸ ", "✿ ", "◆ ", "◇ " }
        return (vim.g.icons_enabled == false and plain or nerd)[ctx.level]
      end,
    },
    code = { border = "thin" },
    anti_conceal = { disabled_modes = { "n" } },
    win_options = { concealcursor = { rendered = "nvc" } },
  },
  keys = {
    { "<Leader>um", "<Cmd>RenderMarkdown toggle<CR>", desc = "Toggle render-markdown" },
  },
}
