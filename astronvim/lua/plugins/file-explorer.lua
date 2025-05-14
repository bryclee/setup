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
        -- go_out_plus = "-",
        -- go_out = "",
      },
    },
  },
}
