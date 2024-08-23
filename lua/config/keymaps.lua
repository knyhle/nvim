-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v", "x" }, ";", ":", { desc = "command" })
vim.keymap.set({ "n", "v", "x" }, ":", ";", { desc = "command" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

vim.keymap.set("n", "<leader><Tab>n", "<CMD>tabnext<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader><Tab>p", "<CMD>tabprevious<CR>", { desc = "Previous tab" })

local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<S-h>", function()
  harpoon:list():prev()
end)
vim.keymap.set("n", "<S-l>", function()
  harpoon:list():next()
end)
