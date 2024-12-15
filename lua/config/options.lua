-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
  -- Set Python host for Windows
  vim.g.python3_host_prog = "~/.pyenv-win-venv/envs/nvim/Scripts/python.exe"
else
  -- Set Python host for Unix-based systems
  vim.g.python3_host_prog = "~/.pyenv/versions/nvim/bin/python"
end
