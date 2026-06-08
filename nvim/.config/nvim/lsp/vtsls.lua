local util = require "lspconfig.util"

return {
    cmd = { "vtsls", "--stdio"},
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" } ,
    init_options = {
        hostInfo = "neovim"
    },
    root_dir = function(bufnr, on_dir)
        vim.notify("1", vim.log.levels.INFO)
        -- The project root is where the LSP can be started from
        -- As stated in the documentation above, this LSP supports monorepos and simple projects.
        -- We select then from the project root, which is identified by the presence of a package
        -- manager lock file.
        local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }
        -- Give the root markers equal priority by wrapping them in a table
        root_markers = vim.fn.has('nvim-0.11.3') == 1 and { root_markers, { '.git' } }
        or vim.list_extend(root_markers, { '.git' })
        vim.notify("1", vim.log.levels.INFO)

        -- exclude deno
        if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
            return
        end

        -- We fallback to the current working directory if no project root is found
        local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
        vim.notify("vtsls root_dir: " .. project_root, vim.log.levels.INFO)

        on_dir(project_root)
    end,
        --
        -- root_dir = function(fname)
            -- -- Only return a root if a tsconfig/jsconfig exists
            -- return util.find_package_json_ancestor(fname) or util.find_node_modules_ancestor(fname) or util.path.dirname(fname)
        -- end,
}
