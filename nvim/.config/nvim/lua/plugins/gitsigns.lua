local M = {}

M.install = function()
  vim.cmd([[Plug 'lewis6991/gitsigns.nvim']])
end

M.setup = function()
  require('gitsigns').setup()
end

return M
