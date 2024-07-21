local wezterm = require 'wezterm'

local fonts = {
  default = "Monaspace Neon",
  italic = "Monaspace Krypton"
}

function fonts.apply_to_config(config)
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
end

return fonts
