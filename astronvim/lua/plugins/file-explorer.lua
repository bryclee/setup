-- if true then return {} end

return {
  -- For mini files
  {
    "echasnovski/mini.nvim",
    specs = {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>-"] = { ":e %:p:h<CR>", desc = "Explorer from current buffer" },
          },
        },
      },
    },
  },
}
