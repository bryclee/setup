-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local wk = require("which-key")
local qc = "<leader>;"

wk.add({
  { qc, group = "Quick commands" },
  { qc .. "w", rhs = "<cmd>w<cr>", desc = "Write buffer" },
  { qc .. ";", rhs = ":", desc = "Command" },
  {
    "<C-f>",
    function()
      vim.fn.system({ "tmux", "neww", "tmux-s" })
    end,
    desc = "tmux-s (picker)",
  },
})
