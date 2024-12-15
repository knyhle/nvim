return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function ()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
                term_colors = true,
                no_italic = true,
                no_bold = true, -- Force no bold
                no_underline = true, -- Force no underline
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    treesitter = true,
                    fidget = true,
                    flash = true,
                    harpoon = true,
                    native_lsp = {
                        enabled = true,
                        inlay_hints = {
                            background = true,
                        },
                    },
                }
            })

            vim.cmd.colorscheme "catppuccin"
        end
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },

    -- Detect tabstop and shiftwidth automatically
    'tpope/vim-sleuth',

    -- Git related plugins
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    {
        -- Adds git related signs to the gutter, as well as utilities for managing changes
        'lewis6991/gitsigns.nvim',
        opts = {
            -- See `:help gitsigns.txt`
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            -- Fuzzy Finder Algorithm which requires local dependencies to be built.
            -- Only load if `make` is available. Make sure you have the system
            -- requirements installed.
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                -- NOTE: If you are having trouble with this installation,
                --       refer to the README for telescope-fzf-native for more instructions.
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- NOTE: This is where your plugins related to LSP can be installed.
    --  The configuration is done below. Search for lspconfig to find it below.
    {
        -- LSP Configuration & Plugins
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',

            -- Useful status updates for LSP
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },
    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            {
                'L3MON4D3/LuaSnip',
                build = (function()
                    -- Build Step is needed for regex support in snippets
                    -- This step is not supported in many windows environments
                    -- Remove the below condition to re-enable on windows
                    if vim.fn.has 'win32' == 1 then
                        return
                    end
                    return 'make install_jsregexp'
                end)(),
                keys = function()
                    return {}
                end,
            },
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        opts = {},
        -- stylua: ignore
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "ThePrimeagen/harpoon",
        event = "BufEnter",
        branch = "harpoon2",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
        },
        config = function()
            local status_ok, harpoon = pcall(require, "harpoon")
            if not status_ok then
                return
            end

            harpoon.setup()

            vim.keymap.set("n", "<leader>fm", "<cmd>Telescope harpoon marks<cr>", { desc = "Telescope Harpoon Marks" })
            vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
            vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
            vim.keymap.set("n", "<leader>ht", function() harpoon:list():select(2) end)
            vim.keymap.set("n", "<leader>hn", function() harpoon:list():select(3) end)
            vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(4) end)

            local tele_status_ok, telescope = pcall(require, "telescope")
            if not tele_status_ok then
                return
            end

            telescope.load_extension("harpoon")
        end,
    },
}
