-- [[ Formatting ]]

vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    local enabled_filetypes = {
      lua = true,
      go = true,
      proto = true,
      bash = true,
      sh = true,
      tf = true,
      terraform = true,
      ['terraform-vars'] = true,
    }
    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 500 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    proto = { 'buf' },
    terraform = { 'terraform_fmt' },
    tf = { 'terraform_fmt' },
    sh = { 'shfmt' },
    bash = { 'shfmt' },
    ['terraform-vars'] = { 'terraform_fmt' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>cf', function() require('conform').format { async = true } end, { desc = '[F]ormat buffer' })
