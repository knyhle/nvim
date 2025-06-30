return {
  {
    "saghen/blink.cmp",
    -- !Important! Make sure you're using the latest release of LuaSnip
    -- `main` does not work at the moment
    dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },
    version = "1.*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = { preset = "luasnip" },
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        menu = {
          border = "single",
        },
        documentation = {
          auto_show = true,
          window = {
            border = "single",
          },
        },
      },
      sources = {
        default = { "lsp", "snippets", "buffer", "path" },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { window = { border = "single" } },
    },
    opts_extend = { "sources.default" },
  },
}
