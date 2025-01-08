local M = {}

M.install = function()
    vim.cmd([[Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}]])
end

M.setup = function()
	require('nvim-treesitter.configs').setup({
		auto_install = true,
		hightlight = { enable = true },
		indent = { enable = false }
	})
end

return M
