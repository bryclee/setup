return {
  "ibhagwan/fzf-lua",
  opts = {
    winopts = {
      backdrop = 100,
    },
    keymap = {
      fzf = {
        true,
        ["ctrl-d"] = "half-page-down",
        ["ctrl-u"] = "half-page-up",
      },
    },
    oldfiles = {
      include_current_session = true,
    },
  },
}
