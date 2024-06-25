local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

-- NOTE: Section - Appearance:

-- Color theme
config.color_scheme = 'Rosé Pine (base16)'
-- Font
config.font = wezterm.font 'Maple Mono'
-- Font size
config.font_size = 12.5

-- NOTE: Section - Keybindings:

-- I want to configure everything on my own
config.disable_default_key_bindings = true
-- For following processes I don't want to show a confirmation dialog when closing a tab
config.skip_close_confirmation_for_processes_named = {
  'zsh',
  '.yazi-wrapped'
}
-- Leader key CTRL+SHIFT+Space
config.leader = { key = 'Space', mods = 'CTRL|SHIFT'}
config.keys = {
  -- New tab
  {
    key = 't',
    mods = 'SUPER',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Close tab
  {
    key = 'w',
    mods = 'SUPER',
    action = act.CloseCurrentTab { confirm = true },
  },
  -- Split vertically right
  {
    key = 'Enter',
    mods = 'SUPER',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  {
    key = 'Enter',
    mods = 'CTRL|SHIFT',
    action = act.SplitPane {
      direction = 'Right',
      size = { Percent = 50 },
    },
  },
  -- Close current pane
  {
    key = 'w',
    mods = 'CTRL|SHIFT',
    action = act.CloseCurrentPane { confirm = true }
  },
  -- Navigate previous and next pane
  {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Prev'
  },
  {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = act.ActivatePaneDirection 'Next'
  },
  -- Copy to clipboard
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard', },
  -- Paste from clipboard
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard', },
}
  -- Navigate tabs by index
for i = 1,9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'SUPER',
    action = act.ActivateTab(i - 1),
  })
end

return config
