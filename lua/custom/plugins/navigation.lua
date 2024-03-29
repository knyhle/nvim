return {
	-- [[ File Explorer ]]
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup({
				skip_confirm_for_simple_edits = true,
				use_default_keymaps = false,
				keymaps = {
					["g?"] = "actions.show_help",
					["<CR>"] = "actions.select",
					["<C-c>"] = "actions.close",
					["<C-l>"] = "actions.refresh",
					["-"] = "actions.parent",
					["_"] = "actions.open_cwd",
					["`"] = "actions.cd",
					["~"] = "actions.tcd",
					["gs"] = "actions.change_sort",
					["gx"] = "actions.open_external",
					["g."] = "actions.toggle_hidden",
					["g\\"] = "actions.toggle_trash",
				},
			})

			vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open Folder" })
		end,
	},

	-- [[ Tmux Navigation ]]
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			local nvim_tmux_nav = require("nvim-tmux-navigation")
			nvim_tmux_nav.setup({
				disable_when_zoomed = true, -- defaults to false
			})

			vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft, { desc = "Tmux Navigate Left" })
			vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown, { desc = "Tmux Navigate Down" })
			vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp, { desc = "Tmux Navigate Up" })
			vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight, { desc = "Tmux Navigate Right" })
		end,
	},
	-- [[ Harpoon ]]
	{
		"ThePrimeagen/harpoon",
		event = "BufEnter",
		branch = "harpoon2",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local status_ok, harpoon = pcall(require, "harpoon")
			if not status_ok then
				return
			end

			harpoon.setup()

			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():append()
			end)
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end)

			vim.keymap.set("n", "<leader>eh", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>et", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>en", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>es", function()
				harpoon:list():select(4)
			end)

			-- Toggle previous & next buffers stored within Harpoon list
			vim.keymap.set("n", "<S-h>", function()
				harpoon:list():prev()
			end)
			vim.keymap.set("n", "<S-l>", function()
				harpoon:list():next()
			end)
		end,
	},
}
