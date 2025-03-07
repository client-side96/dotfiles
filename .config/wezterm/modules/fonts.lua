local wezterm = require("wezterm")

local fonts = {
	default = "Monaspace Argon",
	italic = "Monaspace Argon",
}

function fonts.apply_to_config(config)
	config.font_size = 15
	config.line_height = 1.2
	config.font = wezterm.font({
		family = fonts.default,
		weight = "Medium",
		harfbuzz_features = {
			"ss01",
			"ss02",
			"ss03",
			"ss04",
			"ss05",
			"ss06",
			"ss07",
			"ss08",
			"ss09",
			"calt",
			"liga",
		},
	})

	config.font_rules = {
		{
			intensity = "Normal",
			italic = true,
			font = wezterm.font({
				family = fonts.italic,
				italic = true,
				weight = "Medium",
				harfbuzz_features = {
					"ss01",
					"ss02",
					"ss03",
					"ss04",
					"ss05",
					"ss06",
					"ss07",
					"ss08",
					"ss09",
					"calt",
					"liga",
				},
			}),
		},
	}
	config.freetype_load_target = "HorizontalLcd"
end

return fonts
