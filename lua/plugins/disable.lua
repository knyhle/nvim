return {
  { "folke/tokyonight.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  {
    "echasnovski/mini.indentscope",
    enabled = false,
    opts = {
      draw = {
        animation = function()
          return 0
        end,
      },
    },
  },
  { "RRethy/vim-illuminate", enabled = false },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    opts = {
      options = {
        highlights = {
          buffer_selected = { italic = false },
          diagnostic_selected = { italic = false },
          hint_selected = { italic = false },
          pick_selected = { italic = false },
          pick_visible = { italic = false },
          pick = { italic = false },
        },
      },
    },
  },
  { "echasnovski/mini.pairs", enabled = false },
  { "folke/which-key.nvim", enabled = false },
  { "folke/flash.nvim", enabled = false },
}
