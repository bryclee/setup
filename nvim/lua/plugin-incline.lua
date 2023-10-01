require('incline').setup({
  window = {
    winhighlight = {
      active = { Normal = 'StatusLine' },
    },
  },
  hide = {
    cursorline = 'focused_win'
  },
  -- https://github.com/yuki-yano/coc-nav/issues/2
  render = function(props)
    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ':t')
    local modified = vim.api.nvim_buf_get_option(props.buf, 'modified')
    local icon, color = require('nvim-web-devicons').get_icon_color(filename)

--     local nav = {}
--     local ok, nav_var = pcall(function() return vim.api.nvim_buf_get_var(props.buf, 'coc_nav') end)
--     if ok then
--       for _, v in ipairs(nav_var) do
--         table.insert(nav, {
--           ' > ',
--         })
--         table.insert(nav, {
--           v.label,
--           group = v.highlight,
--         })
--         table.insert(nav, {
--           v.name,
--         })
--       end
--     end
    if modified then
      filename = filename .. ' [+]'
    end

    return {
      { icon, guifg = color },
      { ' ' },
      { filename },
      -- nav,
    }
  end
})

vim.opt.laststatus = 3
