---@type LazySpec
return {
  -- { import = "astrocommunity.git.octo-nvim" }, -- for reviewing pull requests
  {
    "pwntester/octo.nvim",
    -- commit = "f09ff9413652e3c06a6817ba6284591c00121fe0",
    opts = {
      use_local_fs = false,
      picker = "fzf-lua",
      default_to_projects_v2 = false,
      suppress_missing_scope = {
        projects_v2 = true,
      },
      reviews = {
        auto_show_threads = false,
        focus = "right",
      },
      mappings = {
        pull_request = {
          checkout_pr = { lhs = "<localleader>pp", desc = "checkout PR" },
          open_in_browser = { lhs = "<localleader>po", desc = "open PR in browser" },
        },
      },
    },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>O"

          maps.n[prefix .. "st"] = { "<Cmd>Octo review thread<CR>", desc = "View thread" }
          maps.n[prefix .. "sg"] =
            { '<Cmd>exe "normal gf" | tab sp | tabprevious | b# | tabnext<CR>', desc = "Go to file" }

          maps.n[prefix] = { desc = require("astroui").get_icon("Octo", 1, true) .. "Octo" }
          -- Subset of astrocommunity mappings
          maps.n[prefix .. "i"] = { desc = "Issues" }
          maps.n[prefix .. "ic"] = { "<Cmd>Octo issue close<CR>", desc = "Close current issue" }
          maps.n[prefix .. "il"] = { "<Cmd>Octo issue list<CR>", desc = "List open issues" }
          maps.n[prefix .. "io"] = { "<Cmd>Octo issue browser<CR>", desc = "Open current issue in browser" }
          maps.n[prefix .. "ir"] = { "<Cmd>Octo issue reopen<CR>", desc = "Reopen current issue" }
          maps.n[prefix .. "iu"] = { "<Cmd>Octo issue url<CR>", desc = "Copies URL of current issue" }
          maps.n[prefix .. "p"] = { desc = "Pull requests" }
          maps.n[prefix .. "pc"] = { "<Cmd>Octo pr close<CR>", desc = "Close current PR" }
          maps.n[prefix .. "pd"] = { "<Cmd>Octo pr diff<CR>", desc = "Show PR diff" }
          maps.n[prefix .. "pl"] = { "<Cmd>Octo pr changes<CR>", desc = "List changed files in PR" }
          maps.n[prefix .. "pn"] = { "<Cmd>Octo pr create<CR>", desc = "Create PR for current branch" }
          maps.n[prefix .. "po"] = { "<Cmd>Octo pr browser<CR>", desc = "Open current PR in browser" }
          maps.n[prefix .. "pp"] = { "<Cmd>Octo pr checkout<CR>", desc = "Checkout PR" }
          maps.n[prefix .. "pr"] = { "<Cmd>Octo pr ready<CR>", desc = "Mark draft as ready for review" }
          maps.n[prefix .. "ps"] = { "<Cmd>Octo pr list<CR>", desc = "List open PRs" }
          maps.n[prefix .. "pt"] = { "<Cmd>Octo pr commits<CR>", desc = "List PR commits" }
          maps.n[prefix .. "pu"] = { "<Cmd>Octo pr url<CR>", desc = "Copies URL of current PR" }
          maps.n[prefix .. "r"] = { desc = "Repo" }
          maps.n[prefix .. "ro"] = { "<Cmd>Octo repo open<CR>", desc = "Open current repo in browser" }
          maps.n[prefix .. "ru"] = { "<Cmd>Octo repo url<CR>", desc = "Copies URL of current repo" }
          maps.n[prefix .. "x"] = { "<Cmd>Octo actions<CR>", desc = "Run an action" }
        end,
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "octo://*",
        callback = function()
          vim.keymap.set(
            { "n" },
            "<localleader>st",
            "<Cmd>Octo review thread<CR>",
            { desc = "View thread", buffer = true }
          )
          vim.keymap.set(
            { "n" },
            "<localleader>sg",
            '<Cmd>exe "normal gf" | tab sp | tabprevious | b# | tabnext<CR>',
            { desc = "Go to file", buffer = true }
          )
        end,
      })
    end,
  },
}
