local map = vim.api.nvim_set_keymap
local utils = require('telescope.utils')
local default_opts = {noremap = true, silent = true}

map('n', '<C-T>', "<cmd>lua require('telescope.builtin').find_files()<CR>", default_opts)
map('n', '<C-P>', "<cmd>lua require('telescope.builtin').buffers()<CR>", default_opts)
map('n', '<leader>tt', "<cmd>lua require('telescope.builtin').find_files{no_ignore = true}<CR>", default_opts)
map('n', '<leader>t/', "<cmd>lua require('telescope.builtin').live_grep()<CR>", default_opts)
map('n', '<leader>tE', "<cmd>lua require('telescope.builtin').file_browser()<CR>", default_opts)
-- map('n', '<leader>te', "<cmd>lua require('telescope.builtin').file_browser{cwd: utils.buffer_dir()}<CR>", default_opts)

map('n', '<leader>Z', ':source ~/.config/nvim/init.vim<CR>', default_opts)
