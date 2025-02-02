local colors = {
	crust = "#11111b",
	mantle = "#181825",
	base = "#1e1e2e",
	text = "#cdd6f4",
	subtext_0 = "#a6adc8",
	surface_0 = "#313244",
	mauve = "#cba6f7",
	red = "#f38ba8",
	teal = "#94e2d5",
	blue = "#89b4fa",
}

function colors.apply_to_config(config)
	config.color_scheme = "Catppuccin Mocha (Gogh)"
	config.colors = {
		tab_bar = {
			background = colors.base,
			active_tab = {
				bg_color = colors.base,
				fg_color = colors.text,
				intensity = "Bold",
			},
			inactive_tab = {
				bg_color = colors.surface_0,
				fg_color = colors.subtext_0,
				intensity = "Normal",
			},
			inactive_tab_hover = {
				bg_color = colors.base,
				fg_color = colors.text,
				intensity = "Bold",
			},
			new_tab = {
				bg_color = colors.surface_0,
				fg_color = colors.subtext_0,
				intensity = "Normal",
			},
			new_tab_hover = {
				bg_color = colors.base,
				fg_color = colors.text,
				intensity = "Bold",
			},
		},
	}
end

return colors
