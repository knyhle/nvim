-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { desc = "command" })
vim.keymap.set("n", ":", ";", { desc = "command" })

vim.keymap.set("n", "<BS>", "<C-^>`”zz", { desc = "Switch to previous buffer" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file, { desc = "Add file to harpoon" })
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu, { desc = "Toggle harpoon quick menu" })
vim.keymap.set("n", "<leader>hh", function()
  ui.nav_file(1)
end, { desc = "Navigate to harpoon file 1" })
vim.keymap.set("n", "<leader>ht", function()
  ui.nav_file(2)
end, { desc = "Navigate to harpoon file 2" })
vim.keymap.set("n", "<leader>hn", function()
  ui.nav_file(3)
end, { desc = "Navigate to harpoon file 3" })
vim.keymap.set("n", "<leader>hs", function()
  ui.nav_file(4)
end, { desc = "Navigate to harpoon file 4" })

local nvim_tmux_nav = require("nvim-tmux-navigation")
nvim_tmux_nav.setup({})
vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Tmux Navigate Left" })
vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Tmux Navigate Down" })
vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Tmux Navigate Up" })
vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Tmux Navigate Right" })
