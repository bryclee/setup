vim.keymap.set(
  { "n" },
  "dd",
  "<Cmd>call setqflist(filter(getqflist(), {idx -> idx != line('.') - 1}), 'r') <Bar> cc<CR>",
  {
    desc = "Remove qf entry",
    buffer = true,
    silent = true,
  }
)
