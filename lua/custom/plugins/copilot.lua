return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		dependencies = {
			"hrsh7th/nvim-cmp",
		},
		cmd = "Copilot",
		build = ":Copilot auth",
		config = function()
			require("copilot").setup({
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<C-e>",
					},
				},
			})

			-- -- hide copilot suggestions when cmp menu is open
			-- -- to prevent odd behavior/garbled up suggestions
			-- local cmp_status_ok, cmp = pcall(require, "cmp")
			-- if cmp_status_ok then
			-- 	cmp.event:on("menu_opened", function()
			-- 		vim.b.copilot_suggestion_hidden = true
			-- 	end)
			--
			-- 	cmp.event:on("menu_closed", function()
			-- 		vim.b.copilot_suggestion_hidden = false
			-- 	end)
			-- end
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = true, -- Enable debugging
			-- See Configuration section for rest
			-- window = {
			-- 	layout = "float",
			-- 	relative = "cursor",
			-- 	width = 1,
			-- 	height = 0.4,
			-- 	row = 1,
			-- },
		},
		keys = {
			-- Quick chat with Copilot
			{
				"<leader>ccq",
				function()
					local input = vim.fn.input("Quick Chat: ")
					if input ~= "" then
						require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
					end
				end,
				desc = "CopilotChat - Quick chat",
			},
			-- {
			-- 	"<leader>ccx",
			-- 	":CopilotChatInline<cr>",
			-- 	mode = "x",
			-- 	desc = "CopilotChat - Inline chat",
			-- },
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
