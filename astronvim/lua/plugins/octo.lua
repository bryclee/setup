---@type LazySpec
return {
  {
    "pwntester/octo.nvim",
    commit = "616fabd2beea95c15d6001a319d73925cd1ee40b",
    opts = {
      use_local_fs = true,
      picker = "fzf-lua",
      default_to_projects_v2 = false,
      suppress_missing_scope = {
        projects_v2 = true,
      },
    },
  },
}
