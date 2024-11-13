-- Updating core plugins
return {
  { "folke/flash.nvim", enabled = false },
  {
    -- https://www.lazyvim.org/configuration/recipes#supertab
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })
    end,
  },
  {
    "folke/noice.nvim",
    -- enabled = false,
    keys = {
      { "<c-f>", mode = { "s", "n" }, false },
    },
    opts = {
      cmdline = {
        enabled = false,
        view = "cmdline",
      },
      popupmenu = {
        enabled = false,
        backend = "nui",
        view = "popupmenu",
      },
      -- notify = {
      --   view = "mini",
      -- },
      messages = {
        enabled = false,
        view = "messages",
      },
      presets = {
        -- bottom_search = false,
        command_palette = false,
        long_message_to_split = true,
      },
    },
  },
  {
    "pwntester/octo.nvim",
    commit = "616fabd2beea95c15d6001a319d73925cd1ee40b",
    opts = {
      default_to_projects_v2 = false,
    },
  },
}
