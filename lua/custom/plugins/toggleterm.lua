return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    require("toggleterm").setup()
    vim.keymap.set({ "n", "t" }, "<M-t>", "<cmd>ToggleTerm<cr>")
  end,
}
