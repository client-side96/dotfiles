local wezterm = require 'wezterm'
local act = wezterm.action

local config = wezterm.config_builder()

local env = {
  home = "/Users/frey_do"
}

local colors = {
  white = "#eff1f5",
  light_gray = "#ccd0da",
  lavender = "#7287fd",
  maroon = "#e64553",
  text = "#4c4f69",
  light_text = "#6c6f85"
}

local fonts = {
  default = "Monaspace Neon",
  italic = "Monaspace Krypton"
}

-- NOTE: Section - Appearance:

-- Color theme
config.color_scheme = 'Catppuccin Latte'

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = colors.lavender,
      fg_color = colors.white
    },
    inactive_tab = {
      bg_color = colors.white,
      fg_color = colors.light_text
    },
    inactive_tab_hover = {
      bg_color = colors.light_gray,
      fg_color = colors.text
    },
    new_tab = {
      bg_color = colors.white,
      fg_color = colors.lavender
    },
    new_tab_hover = {
      bg_color = colors.light_gray,
      fg_color = colors.lavender
    }
  }
}

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
  active_titlebar_bg = colors.white,
  inactive_titlebar_bg = colors.light_gray
}

-- Font
config.font_size = 13
config.font = wezterm.font {
  family = fonts.default,
  harfbuzz_features = {
    "ss01", "ss02", "ss03", "ss04",
    "ss05", "ss06", "ss07", "ss08",
    "ss09", "calt", "liga"
  }
}

config.font_rules = {
  {
    intensity = "Normal",
    italic = true,
    font = wezterm.font {
      family = fonts.italic,
      italic = true,
      harfbuzz_features = {
        "ss01", "ss02", "ss03", "ss04",
        "ss05", "ss06", "ss07", "ss08",
        "ss09", "calt", "liga"
      },
    }
  }
}

-- Padding
config.window_padding = {
  top = "1cell",
  left = "1cell",
  bottom = "1cell",
  right = "1cell",
}



-- NOTE: Section - Keybindings:

-- I want to configure everything on my own
config.disable_default_key_bindings = true

-- For following processes I don't want to show a confirmation dialog when closing a tab
config.skip_close_confirmation_for_processes_named = {
  'zsh',
  '.yazi-wrapped'
}

-- Leader key CTRL+a
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
  -- Open lazygit
  {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnCommandInNewTab {
      args = {
        os.getenv 'SHELL',
        '-c',
        "lazygit"
      },
    }
  },
  -- Open yazi
  {
    key = 'n',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SpawnCommandInNewTab {
      args = {
        os.getenv 'SHELL',
        '-c',
        "yazi"
      },
    }
  }
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


-- Show which key table is active in the status area
wezterm.on('update-right-status', function(window, pane)
  local name = window:active_key_table()
  if name then
    name = ' TABLE: ' .. name .. " "
  end
  window:set_right_status(
    wezterm.format{
      {Foreground={Color=colors.maroon}},
      {Background={Color=colors.light_gray}},
      {Text=(name or '')}
    }
  )
end)

return config
