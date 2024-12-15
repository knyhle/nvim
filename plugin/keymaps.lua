local map = vim.keymap.set

-- [[ Basic Keymaps ]]
-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })
map({ "i", "n" }, "<C-c>", "<cmd>noh<cr><C-c>", { desc = "Escape and Clear hlsearch" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map("n", "s", "<nop>")
map("n", "<leader>x", "<nop>")

map("n", "]d", function()
  vim.diagnostic.goto_next { float = true }
end)
map("n", "[d", function()
  vim.diagnostic.goto_prev { float = true }
end)

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

-- Clear search, diff update and redraw
-- taken from runtime/lua/_editor.lua
map("n", "<M-r>", function()
  vim.cmd "nohlsearch|diffupdate|LspRestart|normal! <C-L><CR>"
end, { desc = "Redraw / Clear hlsearch / Diff Update" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

-- Diagnostic keymaps
-- map("n", "<M-x>", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- map("n", "<leader>xl", "<cmd>lopen<cr>", { desc = "Location List" })
-- map("n", "<leader>xc", "<cmd>copen<cr>", { desc = "Quickfix List" })
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- tabs
map("n", "<leader>t", "<nop>")
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<left>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<right>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Close Tab" })

map("n", "<leader>r", "<nop>")
map("n", "<C-space>", "<nop>")
map("n", "<C-w>-", "<nop>")
map("n", "<C-w>+", "<nop>")
