local wezterm = require 'wezterm'

local fonts = require 'modules.fonts'
local colors = require 'modules.colors'

local window = {}

function window.apply_to_config(config)
  -- Hide titlebar
  config.window_decorations = "RESIZE"

  -- Native tab bar
  config.enable_tab_bar = false
  config.use_fancy_tab_bar = true
  config.window_frame = {
    font = wezterm.font {
      family = fonts.default,
      weight = "Medium"
    },
    font_size = 11,
    -- active_titlebar_bg = colors.base,
    -- inactive_titlebar_bg = colors.overlay,
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
