local plugins = {
  "plugins.telescope",
  "plugins.onenord",
  "plugins.auto_save",
  "plugins.gitsigns",
  "plugins.autopairs",
  -- "plugins.zellij",
  "plugins.neo_tree",
  "plugins.treesitter",
  "plugins.trim",
  "plugins.project",
  "plugins.mini_move",
  "plugins.lsps",
  "plugins.fzf",
}

vim.cmd("call plug#begin()")

for _, plugin in ipairs(plugins) do
  require(plugin).install()
end

vim.cmd("call plug#end()")

for _, plugin in ipairs(plugins) do
  require(plugin).setup()
end

