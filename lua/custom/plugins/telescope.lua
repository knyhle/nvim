return { -- Fuzzy Finder (files, lsp, etc)
  "nvim-telescope/telescope.nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim" },
    { "nvim-tree/nvim-web-devicons" },
  },
  config = function()
    require("telescope").setup {
      pickers = {},
      defaults = {
        file_ignore_patterns = { "node_modules", "vendor" },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require("telescope").load_extension, "fzf")

    -- See `:help telescope.builtin`
    local builtin = require "telescope.builtin"
    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    -- vim.keymap.set("n", "<leader>sg", function()
    --   local ok, search_term = pcall(vim.fn.input, "Grep > ")
    --   -- If pcall fails or input is empty, return early
    --   if not ok or search_term == "" then
    --     return
    --   end
    --   builtin.grep_string { search = search_term }
    -- end, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
    vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
    vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
    vim.keymap.set("n", "<leader><leader>", builtin.git_files, { desc = "[ ] Find existing buffers" })
  end,
}
