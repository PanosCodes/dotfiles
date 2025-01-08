local M = {}

M.install = function()
  vim.cmd([[Plug 'okuuva/auto-save.nvim']])
end

M.setup = function()
  require("auto-save").setup()
end

return M
