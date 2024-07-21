local wezterm = require 'wezterm'

local colors_config = require 'modules.colors'

local status = {}

function status.apply_to_config(window, pane)
  local workspace_name = " " .. window:active_workspace() .. " "
  local key_table_name = window:active_key_table()
  if key_table_name then
    key_table_name = ' TABLE: ' .. key_table_name .. " "
  end
  if key_table_name then
    return window:set_right_status(
      wezterm.format{
        {Foreground={Color=colors_config.red_light}},
        {Background={Color=colors_config.background_1}},
        {Text=(key_table_name or '')}
      }
    )
  end
  if workspace_name then
    local bg_color = string.find(workspace_name, 'ssh') and colors_config.red or colors_config.light_aqua
    return window:set_right_status(
      wezterm.format{
        {Foreground={Color=colors_config.background_hard}},
        {Background={Color=bg_color}},
        {Text=(workspace_name or '')}
      }
    )
  end
end

return status
