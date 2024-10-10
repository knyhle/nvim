return {
  {
    "folke/trouble.nvim",
    opts = {
      auto_jump = true, -- auto jump to the item when there's only one
      focus = true, -- Focus the window when opened
      pinned = true, -- When pinned, the opened trouble window will be bound to the current buffer
      modes = {
        -- diagnostics = { auto_open = true },
      },
    },
    cmd = "Trouble",
    keys = {
      {
        "<leader>tt",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>tT",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },

      {
        "<leader>tq",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
      {
        "<leader>tr",
        "<cmd>Trouble lsp_references toggle focus=true<cr>",
        desc = "LSP References (Trouble)",
      },
      {
        "<leader>tl",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
    },
  },
}
