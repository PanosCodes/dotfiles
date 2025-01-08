local M = {}

M.install = function()
    vim.cmd([[Plug 'cappyzawa/trim.nvim']])
end

M.setup = function()
require("trim").setup({
  trim_on_write = true,
  trim_trailing = true,
  trim_last_line = false,
  trim_first_line = true,
})

end

return M
