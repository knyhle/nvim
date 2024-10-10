-- vim.cmd.colorscheme "catppuccin-macchiato"
vim.cmd.colorscheme "catppuccin-mocha"

vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- Set to true if you have a Nerd Font installed and selected in the terminal
local opt = vim.opt

opt.autowrite = true
opt.guicursor = ""
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
-- opt.colorcolumn = "88"
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
-- vim.schedule(function()
opt.clipboard = "unnamedplus"
-- end)
opt.breakindent = true
opt.undofile = true
opt.ignorecase = true
opt.smartcase = true
opt.signcolumn = "yes"
opt.updatetime = 250
opt.timeoutlen = 300
opt.splitright = true
opt.splitbelow = true
opt.list = true
opt.inccommand = "split"
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.cursorline = false
opt.scrolloff = 10
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.smartcase = true
opt.splitkeep = "screen"
opt.autowrite = true
opt.wrap = true
opt.linebreak = true
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.jumpoptions = "view"
opt.shortmess:append { W = true, I = true, c = true, C = true }
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.autoread = true
opt.swapfile = false
opt.backup = false
opt.errorbells = false
opt.hlsearch = false
