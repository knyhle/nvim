return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local luasnip = require("luasnip")
      local cmp = require("cmp")

      opts.window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      }

      opts.experimental = {
        ghost_text = false,
      }

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
          -- if cmp.visible() then
          --   -- You could replace select_next_item() with confirm({ select = true }) to get VS Code autocompletion behavior
          --   -- cmp.select_next_item()
          --   cmp.confirm({ select = true })
          -- -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
          -- -- this way you will only jump inside the snippet region
          -- -- elseif luasnip.expand_or_jumpable() then
          -- elseif luasnip.expand_or_locally_jumpable() then
          --   luasnip.expand_or_jump()
          -- elseif has_words_before() then
          --   cmp.complete()
          -- else
          --   fallback()
          -- end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
          -- if cmp.visible() then
          --   cmp.select_prev_item()
          -- elseif luasnip.jumpable(-1) then
          --   luasnip.jump(-1)
          -- else
          --   fallback()
          -- end
        end, { "i", "s" }),
      })
    end,
  },

  {
    "mfussenegger/nvim-lint",
    opts = {
      events = { "BufWritePost", "BufReadPost" },
    },
  },
}
