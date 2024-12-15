-- [[ Basic Autocommands ]]
local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = augroup "highlight_yank",
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup "format_options",
  pattern = { "*" },
  callback = function()
    -- Don't have `o` add a comment
    vim.opt_local.formatoptions:remove "o"
    vim.opt_local.formatoptions:remove "r"
  end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup "clean_buffer_on_save",
  pattern = { "*" },
  callback = function()
    -- Save the current cursor position
    local cursor_pos = vim.fn.getcurpos()

    -- Remove carriage returns
    vim.cmd [[%s/\r//ge]]

    -- Remove trailing whitespace if not markdown
    if vim.bo.filetype ~= "markdown" then
      vim.cmd [[%s/\s\+$//e]]
    end

    -- Restore the cursor position
    vim.fn.setpos(".", cursor_pos)
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = augroup "resize_splits",
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd "tabdo wincmd ="
    vim.cmd("tabnext " .. current_tab)
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "close_with_q",
  pattern = {
    "PlenaryTestPopup",
    "grug-far",
    "help",
    "lspinfo",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "neotest-output",
    "checkhealth",
    "neotest-summary",
    "neotest-output-panel",
    "dbout",
    "gitsigns.blame",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", {
      buffer = event.buf,
      silent = true,
      desc = "Quit buffer",
    })
  end,
})

-- make it easier to close man-files when opened inline
vim.api.nvim_create_autocmd("FileType", {
  group = augroup "man_unlisted",
  pattern = { "man" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  group = augroup "auto_create_dir",
  callback = function(event)
    if event.match:match "^%w%w+:[\\/][\\/]" then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup "qf_navigation",
  pattern = "qf",
  callback = function(event)
    local opts = { buffer = event.buf, silent = true }
    vim.keymap.set("n", "<C-n>", "<cmd>cn | wincmd p<CR>", opts)
    vim.keymap.set("n", "<C-p>", "<cmd>cN | wincmd p<CR>", opts)
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup "kickstart-lsp-attach",
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or "n"
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    -- vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help(), { buffer = event.buf, desc = "LSP: " .. desc })

    -- vim.keymap.set("i", "<C-s>", vim.lsp.buf.signature_help(), { buffer = event.buf, desc = "LSP: " .. desc })
    map("C-s", function()
      vim.lsp.buf.signature_help()
    end, "[S]ignature Help", "i")
    -- map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
    map("gd", function()
      vim.lsp.buf.definition()
    end, "[G]oto [D]efinition")
    map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
    map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
    -- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
    map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
    map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
    map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")
    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
    map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
  end,
})
