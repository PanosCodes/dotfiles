local M = {}

M.install = function()
  vim.cmd([[Plug 'nvim-lua/plenary.nvim']])
  vim.cmd([[Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }]])
  vim.cmd([[Plug 'nvim-telescope/telescope-frecency.nvim']])
  vim.cmd([[Plug 'nvim-telescope/telescope-ui-select.nvim']])
end

M.setup = function()
  require("telescope").setup({
    defaults = {
      layout_config = {
        vertical = {
          mirror = true,
        },
      },
      sorting_strategy = "ascending",
      prompt_position = "bottom",
    },
})

  require("telescope").load_extension "frecency"
  require("telescope").load_extension "ui-select"

  vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files({ cwd = vim.fn.expand('%:p:h') })<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep({ cwd = vim.fn.expand('%:p:h') })<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", '<leader>fu', ':lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
end

return M
