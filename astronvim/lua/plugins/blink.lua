--- @type LazySpec
return { -- override blink.cmp plugin
  "Saghen/blink.cmp",
  opts = {
    sources = {
      per_filetype = {
        org = { "orgmode" },
      },
      providers = {
        orgmode = {
          name = "Orgmode",
          module = "orgmode.org.autocompletion.blink",
          fallbacks = { "buffer" },
        },
      },
    },
    cmdline = {
      enabled = false, -- orgmode completion on command line is not working with this enabled
    },
  },
}
