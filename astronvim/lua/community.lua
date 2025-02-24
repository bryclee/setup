-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

-- Core plugins: https://github.com/AstroNvim/AstroNvim/tree/main/lua%2Fastronvim%2Fplugins
-- Community plugins: https://github.com/AstroNvim/astrocommunity/

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.pack.lua" },
  -- import/override with your plugins folder
  -- { import = "astrocommunity.pack.markdown" },
  -- { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.motion.nvim-surround" }, -- for surround motions
  { import = "astrocommunity.fuzzy-finder.fzf-lua" },
  { import = "astrocommunity.markdown-and-latex/markdown-preview-nvim" },
  { import = "astrocommunity.motion.mini-move" },
}
