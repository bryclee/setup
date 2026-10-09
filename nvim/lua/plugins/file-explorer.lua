-- if true then return {} end

return {
  -- For mini files
  {
    "echasnovski/mini.files",
    dependencies = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["-"] = {
              function() require("mini.files").open(vim.api.nvim_buf_get_name(0)) end,
              desc = "Explorer from current buffer",
            },
          },
        },
      },
    },
    opts = {
      mappings = {
        go_in_plus = "<CR>",
        -- go_in = "",
        go_out_plus = "-",
        -- go_out = "",
      },
    },
    config = function(_, opts)
      require("mini.files").setup(opts)

      -- mini.files opens a file by calling `nvim_win_set_buf` on the target
      -- window *before* marking the buffer listed (`buflisted` is only set
      -- true right after, in `H.edit`). Heirline decides whether to show the
      -- winbar during the autocmds fired by that same `nvim_win_set_buf`
      -- call, so it always sees an unlisted buffer and hides the winbar,
      -- with nothing afterward to make it re-check. Work around it by
      -- re-firing FileType for the target window once the file is open.
      local go_in = MiniFiles.go_in
      MiniFiles.go_in = function(go_in_opts)
        local win = MiniFiles.get_explorer_state().target_window
        go_in(go_in_opts)
        if win and vim.api.nvim_win_is_valid(win) then
          vim.api.nvim_win_call(win, function()
            vim.api.nvim_exec_autocmds("FileType", { buffer = vim.api.nvim_win_get_buf(win) })
          end)
        end
      end

      -- Dirvish-style `.`: put the currently focused directory's path on the
      -- command line so it can be edited/acted on, instead of just navigated.
      vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
          local buf_id = args.data.buf_id

          local function put_path_on_cmdline()
            local state = MiniFiles.get_explorer_state()
            local branch = state.branch
            local depth = state.depth_focus or #branch
            local path = branch[depth]
            if path == nil then return end

            if vim.fn.isdirectory(path) == 1 and not path:match("/$") then
              path = path .. "/"
            end

            vim.api.nvim_feedkeys(":" .. vim.fn.fnameescape(path), "n", false)
          end

          vim.keymap.set("n", ".", put_path_on_cmdline, { buffer = buf_id, desc = "Put path on cmdline" })
        end,
      })
    end,
  },
}
