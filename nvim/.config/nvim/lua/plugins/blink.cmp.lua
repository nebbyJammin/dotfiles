return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    'rafamadriz/friendly-snippets',
  },
  version = "1.*",
  opts = {
    keymap = { preset = 'default' },

    completion = { documentation = { auto_show = false } },

    -- (Default) list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = { default = { 'lsp', 'path', 'snippets', 'buffer' } },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"`
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "rust" }
  },
}
