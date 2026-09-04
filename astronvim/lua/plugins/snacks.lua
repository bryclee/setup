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
  ["<C-space>"] = { "select_and_next", mode = { "n", "i", "x" } },
  ["s"] = { "select_and_next", mode = { "n", "x" } },
}

local function diff_file(path)
  local bufnr = vim.api.nvim_get_current_buf()
  local cur_win = vim.api.nvim_get_current_win()
  local gs = require "gitsigns"

  local function fallback_diff()
    local filetype = vim.bo[bufnr].filetype
    vim.cmd "aboveleft vertical new"
    local idx_win = vim.api.nvim_get_current_win()
    local idx_buf = vim.api.nvim_get_current_buf()
    vim.bo[idx_buf].swapfile = false
    vim.bo[idx_buf].buftype = "nofile"
    vim.bo[idx_buf].bufhidden = "wipe"
    vim.bo[idx_buf].filetype = filetype
    pcall(vim.api.nvim_buf_set_name, idx_buf, "gitsigns://empty-index/" .. vim.fn.fnamemodify(path, ":t"))
    vim.bo[idx_buf].modifiable = false
    vim.cmd "diffthis"
    vim.api.nvim_set_current_win(cur_win)
    vim.cmd "diffthis"
  end

  local function ensure_attached()
    local cache = package.loaded["gitsigns.cache"] and require("gitsigns.cache").cache
    if cache and cache[bufnr] and cache[bufnr].compare_text ~= nil then
      return true
    end
    gs.attach(bufnr)
    return vim.wait(1000, function()
      local c = package.loaded["gitsigns.cache"] and require("gitsigns.cache").cache
      return c and c[bufnr] and c[bufnr].compare_text ~= nil
    end, 10)
  end

  if ensure_attached() then
    local ok = pcall(function() gs.diffthis(nil, { vertical = true, split = "aboveleft" }) end)
    if not ok or not vim.wo[cur_win].diff then fallback_diff() end
  else
    fallback_diff()
  end
end

local function git_status_diff(picker)
  local items = picker:selected { fallback = true }
  picker:close()
  if #items == 0 then return end

  if #items > 1 then
    local tabs_data = {}
    for _, item in ipairs(items) do
      local path = require("snacks").picker.util.path(item)
      if path then
        vim.cmd.tabedit(vim.fn.fnameescape(path))
        table.insert(tabs_data, {
          tab = vim.api.nvim_get_current_tabpage(),
          win = vim.api.nvim_get_current_win(),
          path = path,
        })
      end
    end

    for _, data in ipairs(tabs_data) do
      vim.api.nvim_set_current_tabpage(data.tab)
      vim.api.nvim_set_current_win(data.win)
      diff_file(data.path)
    end

    if #tabs_data > 0 then
      vim.api.nvim_set_current_tabpage(tabs_data[1].tab)
      vim.api.nvim_set_current_win(tabs_data[1].win)
    end
  else
    local path = require("snacks").picker.util.path(items[1])
    if path then
      vim.cmd.edit(vim.fn.fnameescape(path))
      diff_file(path)
    end
  end
end

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
        layout = {
          preset = function() return vim.o.columns >= 140 and "ivy" or "vertical" end,
        },
        actions = {
          cycle_win_no_insert = function(picker)
            require("snacks.picker.actions").cycle_win(picker)
            if vim.api.nvim_get_current_win() == picker.input.win.win then vim.cmd "stopinsert" end
          end,
          git_status_diff = git_status_diff,
        },
        sources = {
          git_status = {
            win = {
              input = {
                keys = {
                  ["D"] = { "git_status_diff", desc = "Diff against index" },
                },
              },
              list = {
                keys = {
                  ["D"] = { "git_status_diff", desc = "Diff against index" },
                },
              },
            },
          },
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
            function() require("snacks").lazygit() end,
            desc = "Toggle LazyGit (Snacks)",
          },
          ["<Leader>gy"] = {
            function()
              require("snacks").gitbrowse {
                open = function(url)
                  vim.fn.setreg("+", url)
                  vim.notify("Yanked git URL: " .. url)
                end,
              }
            end,
            desc = "Yank git URL (Snacks)",
          },
        },
        v = {
          ["<Leader>gy"] = {
            function()
              require("snacks").gitbrowse {
                open = function(url)
                  vim.fn.setreg("+", url)
                  vim.notify("Yanked git URL: " .. url)
                end,
              }
            end,
            desc = "Yank git URL for selection (Snacks)",
          },
        },
      },
    },
  },
}
