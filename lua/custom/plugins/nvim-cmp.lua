return {
  {
    -- Autocompletion
    -- "hrsh7th/nvim-cmp",
    "yioneko/nvim-cmp",
    branch = "perf-up",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
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
      -- See `:help cmp`
      local cmp = require "cmp"
      local luasnip = require "luasnip"
      luasnip.config.setup {}

      -- `/` cmdline setup.
      -- cmp.setup.cmdline({ "/", "?" }, {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = "buffer" },
      --   },
      -- })
      --
      -- `:` cmdline setup.
      -- cmp.setup.cmdline(":", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = cmp.config.sources(
      --     { { name = "path" } },
      --     { { name = "cmdline", option = { ignore_cmds = { "Man", "!" } } } }
      --   ),
      -- })

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          -- autocomplete = false,
          completeopt = "menu,menuone,noinsert,neselect",
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          -- ["<C-Space>"] = cmp.mapping.complete(),
          -- Select the [n]ext item

          -- ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-n>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item()
            else
              cmp.complete()
            end
          end, { "i", "s" }),
          -- Select the [p]revious item
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          -- Scroll the documentation window [b]ack / [f]orward
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          -- Accept ([y]es) the completion.
          --  This will auto-import if your LSP supports it.
          --  This will expand snippets if the LSP sent a snippet.
          ["<C-y>"] = cmp.mapping.confirm { select = true },
          -- ["<CR>"] = cmp.mapping.confirm { select = true },

          -- Manually trigger a completion from nvim-cmp.
          --  Generally you don't need this, because nvim-cmp will display
          --  completions whenever it has completion options available.
          -- ["<C-Space>"] = cmp.mapping.complete {},

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

          -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
          --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
        },
        sources = {
          {
            name = "lazydev",
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "luasnip" },
          { name = "path" },
        },
      }
    end,
  },
  -- {
  --   "saghen/blink.cmp",
  --   lazy = true, -- lazy loading handled internally
  --   -- optional: provides snippets for the snippet source
  --   dependencies = "rafamadriz/friendly-snippets",
  --   event = "InsertEnter",
  --
  --   -- use a release tag to download pre-built binaries
  --   version = "v0.*",
  --   -- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  --   -- build = 'cargo build --release',
  --
  --   opts = {
  --     highlight = {
  --       -- sets the fallback highlight groups to nvim-cmp's highlight groups
  --       -- useful for when your theme doesn't support blink.cmp
  --       -- will be removed in a future release, assuming themes add support
  --       use_nvim_cmp_as_default = true,
  --     },
  --     -- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
  --     -- adjusts spacing to ensure icons are aligned
  --     nerd_font_variant = "mono",
  --
  --     -- experimental auto-brackets support
  --     -- accept = { auto_brackets = { enabled = false } },
  --
  --     -- experimental signature help support
  --     trigger = { signature_help = { enabled = true } },
  --
  --     -- for keymap, all values may be string | string[]
  --     -- use an empty table to disable a keymap
  --     keymap = {
  --       show = "<C-space>",
  --       hide = "<C-space>",
  --       accept = "<C-y>",
  --       select_next = { "<C-n>" },
  --       select_prev = { "<C-p>" },
  --
  --       show_documentation = {},
  --       hide_documentation = {},
  --       scroll_documentation_up = "<C-b>",
  --       scroll_documentation_down = "<C-f>",
  --
  --       snippet_forward = "<C-l>",
  --       snippet_backward = "<C-h>",
  --     },
  --     windows = {
  --       autocomplete = {
  --         border = "rounded",
  --       },
  --       documentation = {
  --         border = "rounded",
  --       },
  --       signature_help = {
  --         border = "rounded",
  --       },
  --     },
  --   },
  -- },
}
