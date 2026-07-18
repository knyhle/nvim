vim.pack.add { 'https://github.com/folke/persistence.nvim' }

require('persistence').setup {}

vim.keymap.set('n', '<leader>lq', function() require('persistence').load() end)
