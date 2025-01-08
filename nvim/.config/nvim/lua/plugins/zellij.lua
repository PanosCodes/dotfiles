local M = {}

M.install = function()
    vim.cmd([[Plug 'https://git.sr.ht/~swaits/zellij-nav.nvim']])
end

M.setup = function()
  require("zellij-nav").setup()
  vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "silent !zellij action switch-mode normal"
  })
end

return M
