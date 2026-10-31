local event = "User AstroGitFile" -- Make sure that this runs before gitsigns sets up, as it has conflicting :Git command

-- Plugin to enable Git blame, mostly. Lazygit otherwise works well
return {
  {
    "tpope/vim-fugitive",
    pin = true,
    event = event,
    dependencies = {
      -- Adds GitHub URL support to :GBrowse
      "tpope/vim-rhubarb",
      {
        "Astronvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local prefix = "<Leader>g"

          -- remap existing Git branches to <leader>gB instead
          maps.n[prefix .. "B"] = maps.n[prefix .. "b"]
          -- Git blame
          -- maps.n[prefix .. "b"] = { "<Cmd>Git blame<CR>", desc = "Git blame" }
          -- Copy git URL (file/blob/commit, or cursor line's commit in a blame buffer) to clipboard
          -- Trying snacks' git_browse instead (see nvim/lua/plugins/snacks.lua); leaving these
          -- commented in case I switch back to fugitive + rhubarb.
          -- maps.n[prefix .. "y"] = { "<Cmd>.GBrowse!<CR>", desc = "Copy git URL to clipboard (GBrowse)" }
          -- maps.x[prefix .. "y"] =
          --   { ":GBrowse!<CR>", desc = "Copy git URL for selection to clipboard (GBrowse)" }
          -- Open git URL (file/blob/commit, or cursor line's commit in a blame buffer) in browser
          -- maps.n[prefix .. "o"] = { "<Cmd>.GBrowse<CR>", desc = "Open git URL in browser (GBrowse)" }
          -- maps.x[prefix .. "o"] = { ":GBrowse<CR>", desc = "Open git URL for selection in browser (GBrowse)" }
        end,
      },
    },
    config = function()
      -- q to close on fugitive files as well
      vim.api.nvim_create_autocmd({ "User" }, {
        -- FugitiveObject is for diffs which should be closed in place
        pattern = "FugitiveObject",
        callback = function(args)
          vim.keymap.set("n", "q", function() require("astrocore.buffer").close() end, {
            desc = "Close window",
            buffer = args.buf,
            silent = true,
            nowait = true,
          })
        end,
      })

      vim.api.nvim_create_autocmd({ "User" }, {
        -- These are splits so we close the window
        pattern = "FugitiveIndex,FugitivePager",
        callback = function(args)
          vim.keymap.set("n", "q", "<Cmd>close<CR>", {
            desc = "Close window",
            buffer = args.buf,
            silent = true,
            nowait = true,
          })

          if vim.api.nvim_get_option_value("filetype", { scope = "local" }) then vim.opt.winbar = " " end
        end,
      })
    end,
  },
}
