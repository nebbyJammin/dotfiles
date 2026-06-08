return {
    cmd = { "emmet-language-server", "--stdio" },
    filetypes = {
        "html",
        "css",
        "scss",
        "less",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "jsx",
        "tsx",
        "vue",
        "svelte",
        "astro",
        "markdown",
        "ejs",
        "elixir",
        "eelixir",
        "heex",
    },
    init_options = {
        html = {
            options = {
                -- Optional: Configure Emmet options if needed
                -- For example, to enable BEM support:
                ["bem.enabled"] = true,
            },
        },
        includeLanguages = {
            heex = 'html',
            elixir = 'html',
            eelixir = 'html',
        }
    },
}
