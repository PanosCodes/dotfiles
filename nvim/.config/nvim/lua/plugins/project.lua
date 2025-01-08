local M = {}

M.install = function()
  vim.cmd([[Plug 'ahmedkhalf/project.nvim', {}]])
end

M.setup = function()
  require("project_nvim").setup()
end

return M
