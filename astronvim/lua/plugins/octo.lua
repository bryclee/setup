---@type LazySpec
return {
  {
    "pwntester/octo.nvim",
    required = false,
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
