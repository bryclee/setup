---@type LazySpec
return {
  { import = "astrocommunity.git.octo-nvim" }, -- for reviewing pull requests
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
      reviews = {
        auto_show_threads = false,
        focus = "right",
      },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>O"

          maps.n[prefix .. "st"] = { "<Cmd>Octo review thread<CR>", desc = "View thread" }
          maps.n[prefix .. "sg"] = { '<Cmd>exe "normal gf" | tab sp | tabprevious | b# | tabnext<CR>', desc = "Go to file"}
        end,
      },
    },
    -- init = function()
    --   vim.api.nvim_create_autocmd("BufEnter", {
    --     pattern = "octo://*",
    --     command = "if &diff | set nofoldenable | fi",
    --   })
    -- end,
  },
}
