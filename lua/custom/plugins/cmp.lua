return {
  {
    -- Autocompletion
    -- "hrsh7th/nvim-cmp",
    -- "yioneko/nvim-cmp",
    -- branch = "perf-up",
    "iguanacucumber/magazine.nvim",
    name = "nvim-cmp", -- Otherwise highlighting gets messed up
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      -- "hrsh7th/cmp-nvim-lsp-signature-help",
      {
        "L3MON4D3/LuaSnip",
        dependencies = {
          {
            "rafamadriz/friendly-snippets",
            "saadparwaiz1/cmp_luasnip",
          },
        },
      },
    },
    config = function()
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = "menu,menuone,noinsert,neselect",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-y>"] = cmp.mapping.confirm { select = true },
          ["<C-Space>"] = cmp.mapping.complete {},
          ["<C-l>"] = cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { "i", "s" }),

          ["<C-h>"] = cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { "i", "s" }),
        },
        sources = cmp.config.sources({
          {
            name = "lazydev",
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          -- { name = "nvim_lsp_signature_help" },
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
          -- source = "always",
          header = "",
          prefix = "",
        },
      }
    end,
  },
}
