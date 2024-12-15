-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", ";", ":", { desc = "command" })
vim.keymap.set("n", ":", ";", { desc = "command" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })

function Jump_and_center()
  local char = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd("normal! '" .. char)
  vim.cmd("normal! zz")
end

vim.api.nvim_set_keymap("n", "'", ":lua Jump_and_center()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "`", ":lua Jump_and_center()<CR>", { noremap = true, silent = true })

function SaveAndCenter()
  vim.cmd("write")
  vim.cmd("normal! zz")
end

-- vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save File" })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", ":lua SaveAndCenter()<CR>", { desc = "Save File" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })
