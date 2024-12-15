return {
  {
    "stevearc/qf_helper.nvim",
    opts = {},
    config = function()
      -- use <C-N> and <C-P> for next/prev.
      require("qf_helper").setup()

      vim.keymap.set("n", "<M-N>", "<CMD>QNext<CR>")
      vim.keymap.set("n", "<M-P>", "<CMD>QPrev<CR>")
      -- toggle the quickfix open/closed without jumping to it
      vim.keymap.set("n", "<leader>xc", "<CMD>QFToggle!<CR>")
      -- vim.keymap.set("n", "<leader>xr", "<CMD>LLToggle!<CR>")
    end,
  },
}
