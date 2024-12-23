---@type LazySpec
return {
  {
    "pwntester/octo.nvim",
    commit = "f09ff9413652e3c06a6817ba6284591c00121fe0",
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
