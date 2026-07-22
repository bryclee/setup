--- @type LazySpec
return {
  {
    "folke/snacks.nvim",
    opts = {
      lazygit = {
        enabled = true,
      },
      gitbrowse = {
        enabled = true,
      },
    },
  },
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>gg"] = {
            function()
              require("snacks").lazygit()
            end,
            desc = "Toggle LazyGit (Snacks)",
          },
          ["<Leader>gy"] = {
            function()
              require("snacks").gitbrowse({
                open = function(url)
                  vim.fn.setreg("+", url)
                  vim.notify("Yanked git URL: " .. url)
                end,
              })
            end,
            desc = "Yank git URL (Snacks)",
          },
        },
        v = {
          ["<Leader>gy"] = {
            function()
              require("snacks").gitbrowse({
                open = function(url)
                  vim.fn.setreg("+", url)
                  vim.notify("Yanked git URL: " .. url)
                end,
              })
            end,
            desc = "Yank git URL for selection (Snacks)",
          },
        },
      },
    },
  },
}
