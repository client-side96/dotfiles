local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

local config = wezterm.config_builder()

local workspace = require 'workspace'
local colors = require 'colors'
local fonts = require 'fonts'
local keymaps = require 'keymaps'



-- Color configuration
colors.apply_to_config(config)

-- Font configuration
fonts.apply_to_config(config)

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



-- NOTE: Section - Keybindings:
keymaps.apply_to_config(config)


-- For following processes I don't want to show a confirmation dialog when closing a tab
config.skip_close_confirmation_for_processes_named = {
  'zsh',
  '.yazi-wrapped',
  'yazi',
}

-- Leader key CTRL+a


-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local workspace_name = " " .. window:active_workspace() .. " "
  local key_table_name = window:active_key_table()
  if key_table_name then
    key_table_name = ' TABLE: ' .. key_table_name .. " "
  end
  if key_table_name then
    return window:set_right_status(
      wezterm.format{
        {Foreground={Color=colors.red_light}},
        {Background={Color=colors.background_1}},
        {Text=(key_table_name or '')}
      }
    )
  end
  if workspace_name then
    local bg_color = string.find(workspace_name, 'ssh') and colors.red or colors.light_aqua
    return window:set_right_status(
      wezterm.format{
        {Foreground={Color=colors.background_hard}},
        {Background={Color=bg_color}},
        {Text=(workspace_name or '')}
      }
    )
  end
end)

wezterm.on('gui-startup', function(cmd)
  -- allow `wezterm start -- something` to affect what we spawn
  -- in our initial window
  local args = {}
  if cmd then
    args = cmd.args
  end

  workspace.init()
end)

return config
