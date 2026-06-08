-- vsplit
vim.keymap.set(
  "n",
  "<leader>vv",
  ":vsplit<CR>",
  { noremap = true, silent = true }
)

-- lazygit
vim.keymap.set(
  "n",
  "<leader>ll",
  ":Lazy<CR>",
  { noremap = true, silent = true }
)

-- reset diagnostics
vim.keymap.set(
  "n",
  "<leader>oo",
  function()
    vim.diagnostic.reset()
  end,
  { noremap = true, silent = true }
)

-- noh
vim.keymap.set(
  "n",
  "<leader>ho",
  ":noh<CR>",
  { noremap = true, silent = true }
)
