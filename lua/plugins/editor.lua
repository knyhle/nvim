return {
    {
      "neovim/nvim-lspconfig",
      opts = {
        diagnostics = {
          float = {
            border = "rounded",
          },
        },
      },
    },
    {
      "hrsh7th/nvim-cmp",
      opts = function(_, opts)
        local cmp = require("cmp")
        opts.window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        }
      end,
    },
  }
  