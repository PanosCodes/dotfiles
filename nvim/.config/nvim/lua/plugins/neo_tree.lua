local M = {}

M.install = function()
  vim.cmd([[Plug 'nvim-lua/plenary.nvim']])
  vim.cmd([[Plug 'nvim-tree/nvim-web-devicons']])
  vim.cmd([[Plug 'MunifTanjim/nui.nvim']])
  vim.cmd([[Plug 'nvim-neo-tree/neo-tree.nvim']])
end

M.setup = function()
  require("neo-tree").setup({
      source_selector = {
        winbar = false,
        statusline = false
      },
      filesystem = {
            use_libuv_file_watcher = true,
            hijack_netrw_behavior = "open_default",
            filtered_items = {
              visible = true,
              show_hidden_count = true,
              hide_dotfiles = false,
              hide_gitignored = false,
              hide_by_name = {
                  '.git',
                  '.DS_Store',
                  'thumbs.db',
              },
              never_show = {},
            },
            follow_current_file = {
                enabled = true,
                leave_dirs_open = false,
              },
    }
  })


  vim.api.nvim_set_keymap("n", "<leader>bb", ':Neotree toggle<cr>', { noremap = true, silent =true })
end

return M
