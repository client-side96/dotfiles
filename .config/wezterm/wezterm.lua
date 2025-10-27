local wezterm = require 'wezterm'
local act = wezterm.action
local config = {}
local scheme = wezterm.color.get_builtin_schemes()['Github Dark (Gogh)']

config.color_scheme = 'Github Dark (Gogh)'
config.window_decorations = 'RESIZE'
config.window_frame = {
	font = wezterm.font { family = 'Cascadia Code' },
	font_size = 13.0,
	active_titlebar_bg = scheme.background,
	inactive_titlebar_bg = scheme.foreground,
}

config.colors = {
	tab_bar = {
		background = scheme.background,
		active_tab = {
			bg_color = scheme.background,
			fg_color = scheme.foreground,
			intensity = 'Bold',
		},
		inactive_tab = {
			bg_color = scheme.background,
			fg_color = scheme.brights[1],
		},
		inactive_tab_hover = {
			bg_color = scheme.background,
			fg_color = scheme.foreground,
		},
		new_tab = {
			bg_color = scheme.background,
			fg_color = scheme.brights[1],
		},
		new_tab_hover = {
			bg_color = scheme.background,
			fg_color = scheme.foreground,
		},
	}
}
config.font = wezterm.font 'Cascadia Code'
config.font_size = 13.0
config.line_height = 1.3
config.exit_behavior = 'Hold'
config.use_fancy_tab_bar = true
config.tab_max_width = 50

config.disable_default_key_bindings = true

config.keys = {
	{
		key = 'r',
		mods = 'CMD',
		action = act.ReloadConfiguration,
	},
	{
		key = 't',
		mods = 'CMD',
		action = act.SpawnTab 'CurrentPaneDomain',
	},
	{ key = 'j', mods = 'CMD', action = act.ActivateTabRelative(1) },
	{
		key = 'w',
		mods = 'CMD',
		action = wezterm.action.CloseCurrentPane { confirm = true },
	},
	{
		key = 'n',
		mods = 'CMD',
		action = act.SpawnWindow,
	},
	{
		key = 'Enter',
		mods = 'CMD',
		action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'Enter',
		mods = 'CMD|SHIFT',
		action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
	},
	{
		key = 'C',
		mods = 'CMD',
		action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection',
	},
	{
		key = 'v',
		mods = 'CMD',
		action = act.PasteFrom 'Clipboard',
	},
	{ key = 'q', mods = 'CMD', action = act.QuitApplication },
	{
		key = 'p',
		mods = 'CMD|SHIFT',
		action = act.ShowLauncherArgs {
			flags = 'WORKSPACES',
		},
	},
	{
		key = 'n',
		mods = 'CMD|SHIFT',
		action = act.PromptInputLine {
			description = 'Enter path for session',
			action = wezterm.action_callback(function(_, _, line)
				if line == nil then
					return
				end

				local workspace_dir = line
				local workspace = line:match("^.+/(.+)$") or line

				local tab, pane, window = wezterm.mux.spawn_window {
					workspace = workspace,
					cwd = wezterm.home_dir .. '/Code/github/' .. workspace_dir,
				}
				wezterm.mux.set_active_workspace(workspace)

				window:active_tab():set_title("Editor " .. "(" .. workspace .. ")")

				window:spawn_tab {}
				window:active_tab():set_title("Git " .. "(" .. workspace .. ")")

				window:spawn_tab {}
				window:active_tab():set_title("AI Assistant " .. "(" .. workspace .. ")")

				tab:activate()
			end),
		}
	},

}

for i = 1, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = 'CMD',
		action = act.ActivateTab(i - 1),
	})
end

wezterm.on('update-right-status', function(window, pane)
	window:set_right_status("  " .. window:active_workspace() .. "  ")
end)


return config
