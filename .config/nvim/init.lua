-- Set runtime paths
vim.opt.runtimepath:prepend("~/.vim")
vim.opt.runtimepath:append("~/.vim/after")
vim.o.packpath = vim.o.runtimepath

-- Source ~/.vimrc
vim.cmd("source ~/.vimrc")

-- Initialize vim-plug
vim.cmd("call plug#begin()")

-- START Plugins
vim.cmd([[Plug 'nvim-lua/plenary.nvim']])
vim.cmd([[Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }]])
vim.cmd([[Plug 'neovim/nvim-lspconfig']])
vim.cmd([[Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}]])
vim.cmd([[Plug 'rmehri01/onenord.nvim', { 'branch': 'main' }]])
vim.cmd([[Plug 'okuuva/auto-save.nvim']])
vim.cmd([[Plug 'lewis6991/gitsigns.nvim']])
vim.cmd([[Plug 'tpope/vim-fugitive']])
vim.cmd([[Plug 'windwp/nvim-autopairs']])
vim.cmd([[Plug 'nvimtools/none-ls.nvim']])
vim.cmd([[Plug 'nvim-telescope/telescope-frecency.nvim']])
vim.cmd([[Plug 'https://git.sr.ht/~swaits/zellij-nav.nvim']])
vim.cmd([[Plug 'akinsho/toggleterm.nvim']])

-- NeoTree
vim.cmd([[Plug 'nvim-lua/plenary.nvim']])
vim.cmd([[Plug 'nvim-tree/nvim-web-devicons']])
vim.cmd([[Plug 'MunifTanjim/nui.nvim']])
vim.cmd([[Plug 'nvim-neo-tree/neo-tree.nvim']])

vim.cmd("call plug#end()")
-- END Plugins

-- START Setups 
-- require('mason').setup()
require('onenord').setup()
require("auto-save").setup()
require('gitsigns').setup()
require('nvim-autopairs').setup()
require("zellij-nav").setup()
require("toggleterm").setup()

local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup({
  init_options = {
    formatter = 'rubocop',
    linters = { 'rubocop' },
  },
})

require('nvim-treesitter.configs').setup({
  auto_install = true,
  hightlight = { enable = true }
})

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
          hide_gitignored = true,
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


-- NOTE: Ensures that when exiting NeoVim, Zellij returns to normal mode
vim.api.nvim_create_autocmd("VimLeave", {
    pattern = "*",
    command = "silent !zellij action switch-mode normal"
})
-- END Setups

-- START Keymaps

vim.g.mapleader = " "

-- Telescope 
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", '<leader>fu', ':lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap("v", "C-[", '<gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "C-]", '>gv', { noremap = true, silent = true })

-- END Keymaps
