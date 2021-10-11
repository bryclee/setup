local map = vim.api.nvim_set_keymap

map('n', '<C-T>', '<cmd>lua require("telescope.builtin").find_files()<CR>', {})
