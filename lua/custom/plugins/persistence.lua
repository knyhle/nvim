vim.pack.add { 'https://github.com/folke/persistence.nvim' }

require('persistence').setup {}

vim.keymap.set('n', '<leader>qs', function() require('persistence').load() end)
