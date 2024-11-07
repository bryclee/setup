local event = "User AstroGitFile" -- Make sure that this runs before gitsigns sets up, as it has conflicting :Git command

-- Plugins to enable Git Browse and Git blame, mostly. Lazygit otherwise works well
return {
  {
    "tpope/vim-fugitive",
    event = event,
    dependencies = {
      {
        "Astronvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>g"

          -- remap existing Git branches to <leader>gB instead
          maps.n[prefix .. "B"] = maps.n[prefix .. "b"]
          -- Git blame
          maps.n[prefix .. "b"] = { "<Cmd>Git blame<CR>", desc = "Git blame" }
          maps.n[prefix .. "o"] = { "<Cmd>GBrowse<CR>", desc = "Open in Github" }
          maps.v[prefix .. "o"] = { ":GBrowse<CR>", desc = "Open in Github" }
        end,
      },
    },
    config = function()
      -- q to close on fugitive files as well
      vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = "fugitive,fugitiveblame,git",
        callback = function(args)
          vim.keymap.set("n", "q", "<Cmd>close<CR>", {
            desc = "Close window",
            buffer = args.buf,
            silent = true,
            nowait = true,
          })
        end,
      })
    end,
  },
  {
    "tpope/vim-rhubarb",
    event = event,
    dependencies = {
      { "tpope/vim-fugitive" },
    },
  },
}
