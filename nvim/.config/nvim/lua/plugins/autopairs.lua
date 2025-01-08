local M = {}

M.install = function()
  vim.cmd([[Plug 'windwp/nvim-autopairs']])
end

M.setup = function()
  require('nvim-autopairs').setup()
end

return M
