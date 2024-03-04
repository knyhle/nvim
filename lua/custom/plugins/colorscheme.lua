return {
	-- [[ Colorscheme ]]
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "macchiato",
				transparent_background = true,
				term_colors = true,
				no_italic = true,
				no_bold = true, -- Force no bold
				no_underline = true, -- Force no underline
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
