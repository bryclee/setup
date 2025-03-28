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
  },
}
