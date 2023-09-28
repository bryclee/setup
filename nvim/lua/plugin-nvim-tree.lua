local api = require "nvim-tree.api"

local function tree_on_attach(bufnr)
  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  -- vim.keymap.set('n', '<CR>', api.node.open.replace_tree_buffer, opts('Open: In Place'))
end

require("nvim-tree").setup({
  on_attach = tree_on_attach,
  disable_netrw = false,
  hijack_netrw = false,
})

-- local function toggle_replace()
--   local api = require('nvim-tree.api')
--   if api.tree.is_visible() then
--     api.tree.close()
--   else
--     api.tree.open({ current_window = true, find_file = true })
--   end
-- end

vim.keymap.set('n', '<leader>e', function () api.tree.open({ find_file = true }) end)

