local function get_git_diff()
    local handle = io.popen("git diff --staged")
    if not handle then
        return ""
    end

    local result = handle:read("*a")
    handle:close()
    return result
end

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                transparent_background = true,
                term_colors = true,
                no_italic = true,
                no_bold = true,      -- Force no bold
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

    {
        -- Highlight, edit, and navigate code
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
    },
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({
                hls = { border = "FloatBorder" }
            })
        end
    },

    {
        'stevearc/oil.nvim',
        opts = {},
        -- Optional dependencies
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                skip_confirm_for_simple_edits = true,
                use_default_keymaps = false,
                keymaps = {
                    ["g?"] = "actions.show_help",
                    ["<CR>"] = "actions.select",
                    -- ["<C-s>"] = "actions.select_vsplit",
                    -- ["<C-h>"] = "actions.select_split",
                    -- ["<C-t>"] = "actions.select_tab",
                    -- ["<C-p>"] = "actions.preview",
                    ["<C-c>"] = "actions.close",
                    ["<C-l>"] = "actions.refresh",
                    ["-"] = "actions.parent",
                    ["_"] = "actions.open_cwd",
                    ["`"] = "actions.cd",
                    ["~"] = "actions.tcd",
                    ["gs"] = "actions.change_sort",
                    ["gx"] = "actions.open_external",
                    ["g."] = "actions.toggle_hidden",
                    ["g\\"] = "actions.toggle_trash",
                },
            })
        end
    },

    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({
                hls = { border = "FloatBorder" }
            })
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
            { 'j-hui/fidget.nvim',       opts = {} },

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
    -- copilot
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        opts = {
            suggestion = {
                keymap = {
                    open = "<C-n>"
                },
                auto_trigger = true,
            },
            -- panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
        config = function()
            require("copilot").setup({})
        end
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            { "nvim-telescope/telescope.nvim" }, -- Use telescope for help actions
            { "nvim-lua/plenary.nvim" },
        },
        opts = {
            debug = false,
            show_help = "no",
            prompts = {
                -- Code related prompts
                Explain = "Please explain how the following code works.",

                Review = "Please review the following code and provide suggestions for improvement.",
                Tests = "Please explain how the selected code works, then generate unit tests for it.",
                Refactor = "Please refactor the following code to improve its clarity and readability.",
                FixCode = "Please fix the following code to make it work as intended.",

                BetterNamings = "Please provide better names for the following variables and functions.",
                Documentation = "Please provide documentation for the following code.",
                DocString = "Please create a docstring for the following code.",
                -- Text related prompts

                Summarize = "Please summarize the following text.",
                Spelling = "Please correct any grammar and spelling errors in the following text.",

                Wording = "Please improve the grammar and wording of the following text.",
                Concise = "Please rewrite the following text to make it more concise.",
            },
            disable_extra_info = "no", -- Disable extra information (e.g: system prompt, token count) in the response.
            hide_system_prompt = "no", -- Show user prompts only and hide system prompts.
        },
        build = function()
            vim.notify("Please update the remote plugins by running ':UpdateRemotePlugins', then restart Neovim.")
        end,
        event = "VeryLazy",
        keys = {
            {
                "<leader>ccm",
                function()
                    local diff = get_git_diff()
                    if diff ~= "" then
                        vim.fn.setreg('"', diff)
                        vim.cmd("CopilotChat Write commit message for the change with commitzen convention.")
                    end
                end,
                desc = "CopilotChat - Generate commit message",
            },
            -- Show prompts actions with telescope
            {
                "<leader>ccp",
                function()
                    require("CopilotChat.code_actions").show_prompt_actions()
                end,
                desc = "CopilotChat - Prompt actions",
            },
            -- Code related commands
            { "<leader>cce", "<cmd>CopilotChatExplain<cr>",       desc = "CopilotChat - Explain code" },
            { "<leader>cct", "<cmd>CopilotChatTests<cr>",         desc = "CopilotChat - Generate tests" },
            { "<leader>ccr", "<cmd>CopilotChatReview<cr>",        desc = "CopilotChat - Review code" },
            { "<leader>ccR", "<cmd>CopilotChatRefactor<cr>",      desc = "CopilotChat - Refactor code" },
            { "<leader>ccf", "<cmd>CopilotChatFixCode<cr>",       desc = "CopilotChat - Fix code" },
            { "<leader>ccb", "<cmd>CopilotChatBetterNamings<cr>", desc = "CopilotChat - Better Name" },
            { "<leader>cc'", "<cmd>CopilotChatDocString<cr>",     desc = "CopilotChat - Add simple docstring for code." },
            -- Text related commands
            { "<leader>ccs", "<cmd>CopilotChatSummarize<cr>",     desc = "CopilotChat - Summarize text" },
            { "<leader>ccS", "<cmd>CopilotChatSpelling<cr>",      desc = "CopilotChat - Correct spelling" },
            { "<leader>ccw", "<cmd>CopilotChatWording<cr>",       desc = "CopilotChat - Improve wording" },
            { "<leader>ccc", "<cmd>CopilotChatConcise<cr>",       desc = "CopilotChat - Make text concise" },
            -- Chat with Copilot in visual mode
            {
                "<leader>ccv",
                ":CopilotChatVisual",
                mode = "x",
                desc = "CopilotChat - Open in vertical split",
            },
            {
                "<leader>ccx",
                ":CopilotChatInPlace<cr>",
                mode = "x",
                desc = "CopilotChat - Run in-place code",
            },
            -- Custom input for CopilotChat
            {
                "<leader>cci",
                function()
                    local input = vim.fn.input("Ask Copilot: ")
                    if input ~= "" then
                        vim.cmd("CopilotChat " .. input)
                    end
                end,
                desc = "CopilotChat - Ask input",
            },
            -- Generate commit message base on the git diff
            {
                "<leader>ccm",
                function()
                    local diff = get_git_diff()
                    if diff ~= "" then
                        vim.fn.setreg('"', diff)
                        vim.cmd("CopilotChat Write commit message for the change with commitzen convention.")
                    end
                end,
                desc = "CopilotChat - Generate commit message",
            },
            -- Quick chat with Copilot
            {
                "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        -- Copy all the lines to unnamed register
                        vim.cmd('normal! ggVG"*y')
                        vim.cmd("CopilotChat " .. input)
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
            -- Debug
            { "<leader>ccd", "<cmd>CopilotChatDebugInfo<cr>",     desc = "CopilotChat - Debug Info" },
            -- Fix the issue with diagnostic
            { "<leader>ccf", "<cmd>CopilotChatFixDiagnostic<cr>", desc = "CopilotChat - Fix Diagnostic" },
            -- Clear buffer and chat history
            { "<leader>ccl", "<cmd>CopilotChatReset<cr>",         desc = "CopilotChat - Clear buffer and chat history" },
            -- Toggle Copilot Chat Vsplit
            { "<leader>ccv", "<cmd>CopilotChatVsplitToggle<cr>",  desc = "CopilotChat - Toggle Vsplit" },
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
