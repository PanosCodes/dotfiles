local M = {}

M.install = function()
  vim.cmd([[Plug 'ibhagwan/fzf-lua']])
end

M.setup = function()
  require('fzf-lua').setup()
end

return M
