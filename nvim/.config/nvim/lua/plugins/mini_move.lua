local M = {}

M.install = function()
  vim.cmd([[Plug 'echasnovski/mini.move', {}]])
end

M.setup = function()
  require("mini.move").setup()
end

return M
