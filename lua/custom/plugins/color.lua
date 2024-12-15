return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			no_italic = true,
			no_bold = true,
			no_underline = true,
			styles = {
				comments = {},
				conditionals = {},
			},
		},
	},
	{
		"folke/tokyonight.nvim",
		priority = 1000, -- Make sure to load this before all the other start plugins.
		opts = {
			styles = {
				comments = { italic = false },
				keywords = { italic = false },
			},
		},
	},
}
