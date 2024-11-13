-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false
vim.opt.cc = "121"
vim.opt.so = 3
if vim.fn.executable("rg") == 1 then
  vim.o.grepprg = "rg --vimgrep --smart-case"
end

-- Tmux-s to launch new session
-- vim.keymap.set("n", "<C-f>", function()
--   vim.fn.system({ "tmux", "neww", "tmux-s" })
-- end)

-- Load local vimrc if present
if vim.fn.filereadable("~/.vimrc_local") then
  vim.cmd.source("~/.vimrc_local")
end
