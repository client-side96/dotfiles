local wezterm = require 'wezterm'
local act = wezterm.action

local keymaps = {}

function keymaps.apply_to_config(config)
  -- I want to configure everything on my own
  config.disable_default_key_bindings = true

  config.leader = { key = 'a', mods = 'CTRL'}

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
    -- Close window
    { key = 'q', mods = 'CMD', action = wezterm.action.QuitApplication },
    -- Split vertically right
    {
      key = 'Enter',
      mods = 'SUPER',
      action = act.ActivateKeyTable {
        name = 'split_pane',
        one_shot = true,
      }
    },
    {
      key = 'Enter',
      mods = 'CTRL|SHIFT',
      action = act.ActivateKeyTable {
        name = 'split_pane',
        one_shot = true,
      }
    },
    -- Show debug overlay
    { key = 'D', mods = 'CTRL', action = wezterm.action.ShowDebugOverlay },
    -- Close current pane
    {
      key = 'w',
      mods = 'CTRL|SHIFT',
      action = act.CloseCurrentPane { confirm = true }
    },
    -- Resize pane
    {
      key = 'r',
      mods = 'CTRL|SHIFT',
      action = act.ActivateKeyTable {
        name = 'resize_pane',
        one_shot = false,
      }
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
    -- Show launcher menu
    { key = 'l', mods = 'LEADER', action = wezterm.action.ShowLauncher },
    -- Show workspace launcher
    {
      key = 'p',
      mods = 'CTRL|SHIFT',
      action = act.ShowLauncherArgs {
        flags = 'FUZZY|WORKSPACES',
      },
    },
  }

  config.key_tables = {
    resize_pane = {
      { key = 'LeftArrow', action = act.AdjustPaneSize { 'Left', 1 } },
      { key = 'h', action = act.AdjustPaneSize { 'Left', 1 } },

      { key = 'RightArrow', action = act.AdjustPaneSize { 'Right', 1 } },
      { key = 'l', action = act.AdjustPaneSize { 'Right', 1 } },

      { key = 'UpArrow', action = act.AdjustPaneSize { 'Up', 1 } },
      { key = 'k', action = act.AdjustPaneSize { 'Up', 1 } },

      { key = 'DownArrow', action = act.AdjustPaneSize { 'Down', 1 } },
      { key = 'j', action = act.AdjustPaneSize { 'Down', 1 } },

      -- Cancel the mode by pressing escape
      { key = 'Escape', action = 'PopKeyTable' },
    },
    split_pane = {
      { key = 'l', action = act.SplitPane { direction = "Right", size = { Percent = 50 } } },
      { key = 'j', action = act.SplitPane { direction = "Down", size = { Percent = 50 } } },
    }
  }

    -- Navigate tabs by index
  for i = 1,9 do
    table.insert(config.keys, {
      key = tostring(i),
      mods = 'SUPER',
      action = act.ActivateTab(i - 1),
    })
  end
end

return keymaps
