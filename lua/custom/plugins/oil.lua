
vim.pack.add { 'https://github.com/stevearc/oil.nvim' }

require("oil").setup({
	default_file_explorer = true,
	skip_confirm_for_simple_edits = true,
	float = {
		-- Border options: "none", "single", "double", "rounded", "shadow"
		border = "rounded",
	},
})

vim.keymap.set("n", "<leader>o", "<CMD>Oil<CR>", { desc = "Open parent directory" })

