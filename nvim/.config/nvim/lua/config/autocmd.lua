-- Treesitter Indent
vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- Lsp Auto Commands
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, {
        buffer = event.buf,
        desc = "LSP: " .. desc,
        remap = false,
      })
    end

    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    -- Auto Format
    if client:supports_method('textDocument/formatting') then
      local format_group = vim.api.nvim_create_augroup("my.lsp.format" .. event.buf, { clear = false })

      vim.api.nvim_clear_autocmds({ group = format_group, buffer = event.buf })

      vim.api.nvim_create_autocmd('BufWritePre', {
        group = format_group,
        buffer = event.buf,
        callback = function()
          vim.lsp.buf.format({
            bufnr = event.buf,
            id = client.id,
            timeout_ms = 5000
          })
        end,
      })
    end

    map("gd", vim.lsp.buf.definition, "Go to Definition")
    map("K", vim.lsp.buf.hover, "Hover Documentation")
    map("<leader>vws", vim.lsp.buf.workspace_symbol, "View Workspace Symbol")
    map("<leader>vd", vim.diagnostic.open_float, "Open Diagnostic Float")
    map("]d", vim.diagnostic.get_next, "Go to Next")
    map("[d", vim.diagnostic.get_prev, "Go to Previous")
    map("<leader>vrr", vim.lsp.buf.references, "List All References")
    map("<leader>vrn", vim.lsp.buf.rename, "Rename All References")
    map("<leader>h", vim.lsp.buf.signature_help, "Signature Help")
    map("<leader>ca", vim.lsp.buf.code_action, "View Code Actions")
  end
})

-- Project root at git
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0) --[[@as string]]
    local path = (arg and vim.fn.isdirectory(arg) == 1) and arg or vim.fn.expand("%:p:h")

    -- Walk up to find the closest .git
    local git_root = vim.fs.root(path, ".git")
    if git_root then
      vim.cmd.cd(git_root)
    else
      -- Fallback: just cd into the directory itself
      if arg and vim.fn.isdirectory(arg) == 1 then
        vim.cmd.cd(arg)
      end
    end
  end,
})
