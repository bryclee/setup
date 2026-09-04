--- @type LazySpec
local picker_keys = {
  ["H"] = "toggle_hidden",
  ["I"] = "toggle_ignored",
  ["f"] = "toggle_focus",
  ["/"] = false,
  ["J"] = "preview_scroll_down",
  ["K"] = "preview_scroll_up",
  ["D"] = "preview_scroll_down",
  ["U"] = "preview_scroll_up",
  ["M"] = "toggle_maximize",
  ["F"] = "toggle_follow",
  ["<c-w><c-w>"] = "cycle_win_no_insert",
}

return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        enabled = true,
      },
      gitbrowse = {
        enabled = true,
      },
      picker = {
        actions = {
          cycle_win_no_insert = function(picker)
            require("snacks.picker.actions").cycle_win(picker)
            if vim.api.nvim_get_current_win() == picker.input.win.win then
              vim.cmd "stopinsert"
            end
          end,
        },
        win = {
          list = {
            keys = picker_keys,
          },
          input = {
            keys = picker_keys,
          },
        },
      },
      notifier = {
        style = "minimal",
      },
      styles = {
        notification = {
          wo = { winblend = 0 },
        },
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>gg"] = {
            function()
              require("snacks").lazygit()
            end,
            desc = "Toggle LazyGit (Snacks)",
          },
          ["<Leader>gy"] = {
            function()
              require("snacks").gitbrowse({
                open = function(url)
                  vim.fn.setreg("+", url)
                  vim.notify("Yanked git URL: " .. url)
                end,
              })
            end,
            desc = "Yank git URL (Snacks)",
          },
        },
        v = {
          ["<Leader>gy"] = {
            function()
              require("snacks").gitbrowse({
                open = function(url)
                  vim.fn.setreg("+", url)
                  vim.notify("Yanked git URL: " .. url)
                end,
              })
            end,
            desc = "Yank git URL for selection (Snacks)",
          },
        },
      },
    },
  },
}
