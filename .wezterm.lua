-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'nord'

config.enable_tab_bar = false
config.window_decorations = 'NONE | RESIZE'
config.window_close_confirmation = 'NeverPrompt'

config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 13

-- and finally, return the configuration to wezterm
return config