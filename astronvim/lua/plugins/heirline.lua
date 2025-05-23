-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This is the recipe to update the winbar, additionally would like to update the tabbar to show the tabs on the left side.
return {
  --- @type LazySpec
  { import = "astrocommunity.recipes.heirline-vscode-winbar" },
  --- @type LazySpec
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts)
      local status = require "astroui.status"

      opts.statusline = {
        hl = { fg = "fg", bg = "bg" },
        status.component.mode(),
        status.component.git_branch(),
        status.component.file_info(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        -- Orgmode statusline: https://github.com/nvim-orgmode/orgmode/blob/27ab1cf9e7ae142f9e9ffb218be50dd920f04cb3/lua/orgmode/init.lua#L231
        status.component.builder {
          {
            ---@diagnostic disable-next-line: undefined-field
            provider = function()
              if not _G.orgmode then return "" end

              return _G.orgmode.statusline()
            end,
          },
          -- This is slow without specifying update, so adding some events.
          -- Orgmode debounces the statusline function, so BufWritePost does not really catch the change immediately
          update = {
            "BufWritePost",
            "BufEnter",
          },
        },
        status.component.fill(),
        status.component.lsp(),
        status.component.virtual_env(),
        status.component.treesitter(),
        status.component.nav(),
        status.component.mode { surround = { separator = "right" } },
      }
    end,
  },
}

-- from https://github.com/AstroNvim/astrocommunity/blob/2e2784a1a1c817680e9dc8e802a4ba813a2bba97/lua/astrocommunity/recipes/heirline-vscode-winbar/init.lua
-- return {
--   "rebelot/heirline.nvim",
--   opts = function(_, opts)
--     local status = require "astroui.status"
--     local path_func = status.provider.filename { modify = ":.:h", fallback = "" }
--
--     local bufpath = function()
--       local path = vim.fn.expand "%:.:h"
--       return (#path > 0) and path .. "/" or ""
--     end
--
--     opts.winbar = { -- create custom winbar
--       -- store the current buffer number
--       init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
--       fallthrough = false, -- pick the correct winbar based on condition
--       -- inactive winbar
--       {
--         condition = function() return not status.condition.is_active() end,
--         -- show the path to the file relative to the working directory
--         status.component.separated_path {
--           path_func = path_func,
--           separator = "/",
--           suffix = "  ",
--         },
--         -- { provider = bufpath },
--         -- add the file name and icon
--         status.component.file_info {
--           file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
--           filename = {},
--           filetype = false,
--           file_modified = false,
--           file_read_only = false,
--           hl = status.hl.get_attributes("winbarnc", true),
--           surround = false,
--           update = "BufEnter",
--         },
--       },
--       -- active winbar
--       {
--         -- show the path to the file relative to the working directory
--         -- status.component.separated_path { path_func = path_func },
--         status.component.separated_path {
--           path_func = path_func,
--           separator = "/",
--           suffix = "  ",
--         },
--         -- add the file name and icon
--         status.component.file_info { -- add file_info to breadcrumbs
--           file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
--           filename = {},
--           filetype = false,
--           file_modified = false,
--           file_read_only = false,
--           hl = status.hl.get_attributes("winbar", true),
--           surround = false,
--           update = "BufEnter",
--         },
--         -- show the breadcrumbs
--         status.component.breadcrumbs {
--           icon = { hl = true },
--           hl = status.hl.get_attributes("winbar", true),
--           prefix = true,
--           padding = { left = 0 },
--         },
--       },
--     }
--
--     vim.opt.showtabline = 1 -- Only show tabline for multiple tabs
--     opts.tabline = { -- tabline, do not show buffers
--       -- { -- file tree padding
--       --   condition = function(self)
--       --     self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
--       --     self.winwidth = vim.api.nvim_win_get_width(self.winid)
--       --     return self.winwidth ~= vim.o.columns -- only apply to sidebars
--       --       and not require("astrocore.buffer").is_valid(
--       --         vim.api.nvim_win_get_buf(self.winid)
--       --       ) -- if buffer is not in tabline
--       --   end,
--       --   provider = function(self)
--       --     return (" "):rep(self.winwidth + 1)
--       --   end,
--       --   hl = { bg = "tabline_bg" },
--       -- },
--       { -- tab list
--         condition = function()
--           return #vim.api.nvim_list_tabpages() >= 2
--         end, -- only show tabs if there are more than one
--         status.heirline.make_tablist({ -- component for each tab
--           provider = status.provider.tabnr(),
--           hl = function(self)
--             return status.hl.get_attributes(
--               status.heirline.tab_type(self, "tab"),
--               true
--             )
--           end,
--         }),
--       },
--       status.component.fill({ hl = { bg = "tabline_bg" } }), -- fill the rest of the tabline with background color
--       status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
--         -- { -- close button for current tab
--         --   provider = status.provider.close_button({
--         --     kind = "TabClose",
--         --     padding = { left = 1, right = 1 },
--         --   }),
--         --   hl = status.hl.get_attributes("tab_close", true),
--         --   on_click = {
--         --     callback = function()
--         --       require("astrocore.buffer").close_tab()
--         --     end,
--         --     name = "heirline_tabline_close_tab_callback",
--         --   },
--         -- },
--     }
--   end,
-- }
