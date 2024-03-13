return {
	-- [[ Telescope ]]
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for install instructions
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			-- { "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires special font.
			--  If you already have a Nerd Font, or terminal set up with fallback fonts
			--  you can enable this
			-- { "nvim-tree/nvim-web-devicons" },
		},
		config = function()
			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({})

			-- Enable telescope extensions, if they are installed
			pcall(require("telescope").load_extension, "fzf")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			-- vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "[S]earch [F]iles" })
			-- vim.keymap.set("n", "<C-p>", function()
			-- 	builtin.find_files(require("telescope.themes").get_dropdown({
			-- 		winblend = 10,
			-- 		previewer = false,
			-- 	}))
			-- end, { desc = "[S]earch [F]iles" })

			vim.keymap.set("n", "<C-.>", function()
				builtin.find_files(require("telescope.themes").get_dropdown({
					prompt_title = "Find Directories",
					winblend = 10,
					previewer = false,
					find_command = { "fd", "--type", "d" },
				}))
			end, { desc = "[S]earch Directories" })

			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set(
				"n",
				"<leader>ss",
				builtin.lsp_document_symbols,
				{ desc = '[S]earch Recent Files ("." for repeat)' }
			)
			-- vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			--
			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set("n", "<leader>sb", function()
				-- You can pass additional cobfiguration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},
}
