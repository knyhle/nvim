-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v", "x" }, ";", ":", { desc = "command" })
vim.keymap.set({ "n", "v", "x" }, ":", ";", { desc = "command" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })

function JumpAndCenter()
  local char = vim.fn.nr2char(vim.fn.getchar())
  vim.cmd("normal! '" .. char)
  vim.cmd("normal! zz")
end

vim.api.nvim_set_keymap("n", "'", ":lua JumpAndCenter()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "`", ":lua JumpAndCenter()<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })