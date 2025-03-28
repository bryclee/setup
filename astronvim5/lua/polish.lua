-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add {
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- }

if vim.fn.executable "rg" == 1 then vim.o.grepprg = "rg --vimgrep --smart-case" end

-- Tmux-s to launch new session
vim.keymap.set("n", "<C-f>", function() vim.fn.system { "tmux", "neww", "tmux-s" } end)

-- Load local vimrc if present
if vim.fn.filereadable "~/.vimrc_local" == 1 then vim.cmd.source "~/.vimrc_local" end

vim.filetype.add {
  extension = {
    json = "jsonc",
  },
}
