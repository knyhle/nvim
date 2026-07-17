-- ============================================================
-- SECTION 7: AUTOCOMPLETE & SNIPPETS
-- blink.cmp and luasnip setup
-- ============================================================
do
  -- [[ Autocomplete Engine ]]
  vim.pack.add {
    { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range '1.*' },
  }
  require('blink.cmp').setup {
    keymap = {
      preset = 'default',
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        border = 'rounded',
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = 'rounded',
        },
      },
    },
    sources = {
      default = { 'lsp', 'path', 'buffer' },
    },
    -- fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  }
end
