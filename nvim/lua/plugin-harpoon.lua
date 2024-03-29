local map = vim.api.nvim_set_keymap
local default_opts = { noremap = true }

map('n', '<leader>Hm', '<cmd>lua require("harpoon.mark").add_file()<CR>', default_opts)
map('n', '<leader>HH', '<cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', default_opts)
map('n', '<leader>1', '<cmd>lua require("harpoon.ui").nav_file(1)<CR>', default_opts)
map('n', '<leader>2', '<cmd>lua require("harpoon.ui").nav_file(2)<CR>', default_opts)
map('n', '<leader>3', '<cmd>lua require("harpoon.ui").nav_file(3)<CR>', default_opts)
map('n', '<leader>4', '<cmd>lua require("harpoon.ui").nav_file(4)<CR>', default_opts)
map('n', '<leader>5', '<cmd>lua require("harpoon.ui").nav_file(5)<CR>', default_opts)
