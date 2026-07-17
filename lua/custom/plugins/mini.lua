-- [[ mini.nvim ]]
vim.pack.add { 'https://github.com/nvim-mini/mini.nvim' }

require('mini.ai').setup {
  -- NOTE: Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
  mappings = {
    around_next = 'aa',
    inside_next = 'ii',
  },
  n_lines = 500,
}

require('mini.surround').setup()
require('mini.statusline').setup()
require('mini.pick').setup()

local mini_extra = require 'mini.extra'
mini_extra.setup()

vim.keymap.set('n', '<leader>sf', ':Pick files<CR>')
vim.keymap.set('n', '<leader><leader>', ':Pick files tool="git"<CR>')

vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to Definition' })
vim.keymap.set('n', 'gr', function() mini_extra.pickers.lsp { scope = 'references' } end, { desc = 'Find references' })
vim.keymap.set('n', '<leader>ds', function() mini_extra.pickers.lsp { scope = 'document_symbol' } end, { desc = 'Document Symbols' })
