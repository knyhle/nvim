return {
  {
    "nvim-treesitter/nvim-treesitter-context",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    enabled = false,
  },
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
  {
    "RRethy/vim-illuminate",
    enabled = false,
  },
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
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "folke/which-key.nvim",
    enabled = false,
  },
  -- {
  --   -- "numiras/semshi",
  --   "wookayin/semshi", -- use a maintained fork
  --   ft = "python",
  --   build = ":UpdateRemotePlugins",
  --   init = function()
  --     -- Disabled these features better provided by LSP or other more general plugins
  --     vim.g["semshi#error_sign"] = false
  --     vim.g["semshi#simplify_markup"] = false
  --     vim.g["semshi#mark_selected_nodes"] = false
  --     vim.g["semshi#update_delay_factor"] = 0.001
  --
  --     -- This autocmd must be defined in init to take effect
  --     vim.api.nvim_create_autocmd({ "VimEnter", "ColorScheme" }, {
  --       group = vim.api.nvim_create_augroup("SemanticHighlight", {}),
  --       callback = function()
  --         -- Only add style, inherit or link to the LSP's colors
  --         vim.cmd([[
  --           " highlight! semshiGlobal gui=italic
  --           highlight! link semshiImported @none
  --           highlight! link semshiParameter @lsp.type.parameter
  --           highlight! link semshiParameterUnused DiagnosticUnnecessary
  --           highlight! link semshiBuiltin @function.builtin
  --           highlight! link semshiAttribute @field
  --           highlight! link semshiSelf @lsp.type.selfKeyword
  --           highlight! link semshiUnresolved @lsp.type.unresolvedReference
  --           highlight! link semshiFree @none
  --           ]])
  --       end,
  --     })
  --   end,
  -- },
}
