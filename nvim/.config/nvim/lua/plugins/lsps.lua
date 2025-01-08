local M = {}

M.install = function()
  vim.cmd([[Plug 'williamboman/mason.nvim', {}]])
  vim.cmd([[Plug 'williamboman/mason-lspconfig.nvim', {}]])
  vim.cmd([[Plug 'neovim/nvim-lspconfig', {}]])
end

M.setup = function()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = { "ts_ls" }
  })

  local lspconfig = require("lspconfig")
  lspconfig.ts_ls.setup({})

end

return M
