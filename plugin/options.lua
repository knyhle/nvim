vim.g.have_nerd_font = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- [[ Setting options ]]
local opt = vim.opt
opt.guicursor = ""
opt.showmode = false
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
-- opt.autowrite = true
-- opt.backup = false
-- opt.colorcolumn = "80"
opt.errorbells = false
opt.expandtab = true
opt.inccommand = "split"
opt.incsearch = true
opt.hlsearch = false
opt.isfname:append "@-@"
opt.ignorecase = true
opt.smartcase = true
-- opt.list = true
opt.number = true
opt.relativenumber = true
-- opt.scrolloff = 8
opt.shiftwidth = 4
opt.signcolumn = "yes"
opt.smartindent = true
opt.softtabstop = 4
opt.splitbelow = true
opt.splitright = true
-- opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.undodir = os.getenv "HOME" .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 50
-- opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.wrap = true
-- opt.hidden = true

-- Netrw
-- vim.g.netrw_keepdir = 0
-- vim.g.netrw_banner = 0
-- vim.g.netrw_localcopydircmd = "cp -r"
vim.g.netrw_browse_split = 0
-- vim.g.netrw_banner = 1
vim.g.netrw_winsize = 25
