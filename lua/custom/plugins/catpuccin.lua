
vim.pack.add {
    { src = 'https://github.com/catppuccin/nvim', name = 'catppuccin' },
}
require('catppuccin').setup {
    no_italic = true,
    no_bold = true,
    no_underline = true,
    auto_integrations = true,
}

vim.cmd.colorscheme 'catppuccin-nvim'


