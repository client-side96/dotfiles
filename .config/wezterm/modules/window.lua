local wezterm = require 'wezterm'

local fonts = require 'modules.fonts'
local colors = require 'modules.colors'

local window = {}

function window.apply_to_config(config)
  -- Hide titlebar
  config.window_decorations = "RESIZE"

  -- Native tab bar
  config.use_fancy_tab_bar = true
  config.window_frame = {
    font = wezterm.font {
      family = fonts.default,
      weight = "Medium"
    },
    font_size = 11,
    active_titlebar_bg = colors.background_hard,
    inactive_titlebar_bg = colors.background_1,
  }


  -- Padding
  config.window_padding = {
    top = "1cell",
    left = "1cell",
    bottom = "1cell",
    right = "1cell",
  }
end

return window
