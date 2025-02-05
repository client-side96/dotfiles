local wezterm = require("wezterm")

package.path = package.path .. ";./env/?.lua;./modules/?.lua"

local config = wezterm.config_builder()

local workspace_switcher = wezterm.plugin.require("https://github.com/MLFlexer/smart_workspace_switcher.wezterm")

local colors_config = require("modules.colors")
local fonts_config = require("modules.fonts")
local keymaps_config = require("modules.keymaps")
local window_config = require("modules.window")
local status_config = require("modules.status")

workspace_switcher.zoxide_path = "/opt/homebrew/bin/zoxide"
workspace_switcher.apply_to_config(config)
workspace_switcher.workspace_formatter = function(label)
	local display_label = label:match(".*[/\\](.*)") or label
	return wezterm.format({
		{ Text = "󱂬: " .. display_label },
	})
end

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
	"zsh",
	".yazi-wrapped",
	"yazi",
}

-- Show which key table is active in the status area
wezterm.on("update-right-status", function(window, pane)
	status_config.apply_to_config(window, pane)
end)

return config
