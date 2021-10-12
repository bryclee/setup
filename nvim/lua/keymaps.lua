local map = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

map('n', '<leader>Z', ':source ~/.config/nvim/init.vim<CR>', default_opts)
