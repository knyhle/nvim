vim.pack.add {
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-pack/nvim-spectre',
}

require('spectre').setup {}

vim.keymap.set('n', '<leader>rn', '<cmd>lua require("spectre").toggle()<CR>', {
  desc = 'Toggle Spectre',
})
