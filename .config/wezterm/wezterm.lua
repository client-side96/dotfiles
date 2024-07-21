local wezterm = require 'wezterm'

package.path = package.path .. ';./env/?.lua;./modules/?.lua'

local config = wezterm.config_builder()

local workspace_config = require 'modules.workspace'
local colors_config = require 'modules.colors'
local fonts_config = require 'modules.fonts'
local keymaps_config = require 'modules.keymaps'
local window_config = require 'modules.window'
local status_config = require 'modules.status'



-- Color configuration
colors_config.apply_to_config(config)

-- Font configuration
fonts_config.apply_to_config(config)

-- Window configuration
window_config.apply_to_config(config)

-- Keybindings
keymaps_config.apply_to_config(config)


-- For following processes I don't want to show a confirmation dialog when closing a tab
config.skip_close_confirmation_for_processes_named = {
  'zsh',
  '.yazi-wrapped',
  'yazi',
}

-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  status_config.apply_to_config(window, pane)
end)

wezterm.on('gui-startup', function(cmd)
  -- allow `wezterm start -- something` to affect what we spawn
  -- in our initial window
  local args = {}
  if cmd then
    args = cmd.args
  end

  workspace_config.init()
end)

return config
