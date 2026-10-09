--- @type LazySpec
return { -- override blink.cmp plugin
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show_delay_ms = 200,
      },
    },
    
    -- cmdline = {
    --   enabled = false, -- orgmode completion on command line is not working with this enabled
    -- },
  },
}
