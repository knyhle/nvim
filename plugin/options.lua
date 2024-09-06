vim.cmd.colorscheme("catppuccin-mocha")

-- [[ Setting options ]]
-- Set to true if you have a Nerd Font installed and selected in the terminal
local opt = vim.opt

opt.colorcolumn = "88"
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.showmode = false
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)
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
opt.cursorline = true
opt.scrolloff = 10
opt.tabstop = 4
opt.shiftwidth = 4
opt.smartindent = true
opt.smartcase = true
opt.splitkeep = "screen"
opt.autowrite = true
opt.wrap = true
opt.linebreak = true

-- Don't have `o` add a comment
opt.formatoptions:remove("o")
opt.guicursor = { "n-v-i-c:block", "ci-ve:ver25", "r-cr:hor20", "o:hor50", "a:blinkon100" }
