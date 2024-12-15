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
    init = function()
      vim.cmd.colorscheme "catppuccin-mocha"
    end,
  },
}
