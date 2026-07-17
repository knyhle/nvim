vim.pack.add { 'https://github.com/alexghergh/nvim-tmux-navigation' }

local tmux_nav = require 'nvim-tmux-navigation'

vim.keymap.set('n', '<C-h>', tmux_nav.NvimTmuxNavigateLeft)
vim.keymap.set('n', '<C-j>', tmux_nav.NvimTmuxNavigateDown)
vim.keymap.set('n', '<C-k>', tmux_nav.NvimTmuxNavigateUp)
vim.keymap.set('n', '<C-l>', tmux_nav.NvimTmuxNavigateRight)
