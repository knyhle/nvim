local function augroup(name) return vim.api.nvim_create_augroup(name, { clear = true }) end

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup 'resize_splits',
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd 'tabdo wincmd ='
    vim.cmd('tabnext ' .. current_tab)
  end,
})

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Don't have `o` add a comment
vim.api.nvim_create_autocmd({ 'FileType' }, {
  group = augroup 'format_options',
  pattern = { '*' },
  callback = function()
    vim.opt_local.formatoptions:remove 'o'
    vim.opt_local.formatoptions:remove 'r'
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup 'clean_buffer_on_save',
  pattern = { '*.lua', '*.ts', '*.tsx', '*.js', '*.jsx', '*.py', '*.go', '*.rs', '*.json', '*.txt' },
  callback = function()
    -- Save the current cursor position
    local cursor_pos = vim.fn.getcurpos()

    -- Remove carriage returns
    vim.cmd [[%s/\r//ge]]

    -- Remove trailing whitespace if not markdown
    vim.cmd [[%s/\s\+$//e]]

    -- Restore the cursor position
    vim.fn.setpos('.', cursor_pos)
  end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'close_with_q',
  pattern = {
    'PlenaryTestPopup',
    'grug-far',
    'help',
    'lspinfo',
    'notify',
    'qf',
    'quicklist',
    'spectre_panel',
    'startuptime',
    'tsplayground',
    'neotest-output',
    'checkhealth',
    'neotest-summary',
    'neotest-output-panel',
    'dbout',
    'gitsigns.blame',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set('n', 'q', '<cmd>close<cr>', {
      buffer = event.buf,
      silent = true,
      desc = 'Quit buffer',
    })
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePre', 'FileWritePre' }, {
  desc = "Automatically create parent directories if they don't exist",
  pattern = '*',
  callback = function()
    local directory = vim.fn.expand '<afile>:p:h'
    -- Ignore URIs (like protocol://) and check if directory already exists
    if not directory:match '^%w+://' and vim.fn.isdirectory(directory) == 0 then vim.fn.mkdir(directory, 'p') end
  end,
})
