return {
	-- [[ Colorscheme ]]
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				term_colors = true,
				no_italic = true,
				no_bold = true, -- Force no bold
				no_underline = true, -- Force no underline
				highlight_overrides = {
					all = function(colors)
						return {
							LineNrAbove = { fg = colors.none },
							LineNr = { fg = colors.none },
							LineNrBelow = { fg = colors.none },
						}
					end,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
