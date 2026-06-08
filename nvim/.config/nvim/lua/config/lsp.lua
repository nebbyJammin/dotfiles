-- some issues with preloading emmet config. Ensure that our config isn't overriden by default conf
vim.lsp.config('emmet_language_server', dofile(vim.fn.stdpath('config') .. '/lsp/emmet_language_server.lua'))

vim.lsp.enable({
  "bash_ls",
  "css_ls",
  "docker_language_server",
  "dexter",
  "emmet_language_server",
  "gopls",
  "html",
  "json_ls",
  "lua_ls",
  "marksman",
  "pyright",
  "svelte",
  "tailwindcss",
  "vtsls",
})

vim.diagnostic.config({
  virtual_lines = true,
  -- virtual_text = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "󰅚 ",
      [vim.diagnostic.severity.WARN] = "󰀪 ",
      [vim.diagnostic.severity.INFO] = "󰋽 ",
      [vim.diagnostic.severity.HINT] = "󰌶 ",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN] = "WarningMsg",
    },
  },
})
