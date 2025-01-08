local M = {}

M.install = function()
  vim.cmd([[Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }]])
end

M.setup = function()
  require('onenord').setup({
    theme = "dark",
  })
end

return M
