return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "stevearc/conform.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/nvim-cmp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "j-hui/fidget.nvim",
    },

    config = function()
      local cmp = require "cmp"
      local cmp_lsp = require "cmp_nvim_lsp"
      local capabilities =
        vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

      require("fidget").setup {}
      require("mason").setup()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "lua_ls",
          "gopls",
        },
        handlers = {
          function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup {
              capabilities = capabilities,
            }
          end,
          ["gopls"] = function()
            require("lspconfig").gopls.setup {
              settings = {
                gopls = {
                  gofumpt = true,
                  codelenses = {
                    gc_details = false,
                    generate = true,
                    regenerate_cgo = true,
                    run_govulncheck = true,
                    test = true,
                    tidy = true,
                    upgrade_dependency = true,
                    vendor = true,
                  },
                  hints = {
                    assignVariableTypes = true,
                    compositeLiteralFields = true,
                    compositeLiteralTypes = true,
                    constantValues = true,
                    functionTypeParameters = true,
                    parameterNames = true,
                    rangeVariableTypes = true,
                  },
                  analyses = {
                    -- fieldalignment = true,
                    nilness = true,
                    unusedparams = true,
                    unusedwrite = true,
                    useany = true,
                  },
                  -- usePlaceholders = true,
                  completeUnimported = true,
                  staticcheck = true,
                  directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
                  semanticTokens = true,
                },
              },
            }
          end,

          ["lua_ls"] = function()
            local lspconfig = require "lspconfig"
            lspconfig.lua_ls.setup {
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                  },
                },
              },
            }
          end,
        },
      }

      local cmp_select = { behavior = cmp.SelectBehavior.Select }

      cmp.setup {
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
          ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
          ["<C-y>"] = cmp.mapping.confirm { select = true },
          ["<C-Space>"] = cmp.mapping.complete(),
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" }, -- For luasnip users.
        }, {
          { name = "buffer" },
        }),
      }

      vim.diagnostic.config {
        -- update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }
    end,
  },
}

-- return {
--   {
--     -- Main LSP Configuration
--     "neovim/nvim-lspconfig",
--     dependencies = {
--       "williamboman/mason.nvim",
--       "williamboman/mason-lspconfig.nvim",
--       "WhoIsSethDaniel/mason-tool-installer.nvim",
--       { "j-hui/fidget.nvim", opts = {} },
--       "hrsh7th/cmp-nvim-lsp",
--     },
--     config = function()
--       local servers = {
--         ruff = {
--           cmd_env = { RUFF_TRACE = "messages" },
--           init_options = {
--             settings = {
--               logLevel = "error",
--             },
--           },
--         },
--         pyright = {},
--         lua_ls = {
--           settings = {
--             Lua = {
--               diagnostics = {
--                 globals = { "vim", "Snacks" },
--               },
--               completion = {
--                 callSnippet = "Replace",
--               },
--             },
--           },
--         },
--         gopls = require "custom.lsp.go",
--       }
--
--       require("mason").setup()
--
--       local ensure_installed = vim.tbl_keys(servers or {})
--       vim.list_extend(ensure_installed, {
--         "stylua", -- Used to format Lua code
--       })
--       require("mason-tool-installer").setup { ensure_installed = ensure_installed }
--       require("mason-lspconfig").setup {
--         handlers = {
--           function(server_name)
--             local server = servers[server_name] or {}
--             -- This handles overriding only values explicitly passed
--             -- by the server configuration above. Useful when disabling
--             -- certain features of an LSP (for example, turning off formatting for tsserver)
--             server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
--
--             require("lspconfig")[server_name].setup(server)
--           end,
--         },
--       }
--     end,
--   },
-- }
