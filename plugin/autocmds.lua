-- [[ Basic Autocommands ]]

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("format-options", { clear = true }),
	pattern = { "*" },
	callback = function()
		-- Don't have `o` add a comment
		vim.opt_local.formatoptions:remove("o")
		vim.opt_local.formatoptions:remove("r")
	end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("remove-carriage-returns", { clear = true }),
	pattern = { "*" },
	callback = function()
		-- Save the current cursor position
		local cursor_pos = vim.fn.getcurpos()

		-- Remove carriage returns
		vim.cmd([[%s/\r//ge]])

		-- Restore the cursor position
		vim.fn.setpos(".", cursor_pos)
	end,
})
