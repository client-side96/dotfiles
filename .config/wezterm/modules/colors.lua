local colors = {
  background_hard = "#1d2021",
  background_soft = "#32302f",
  background_default = "#282828",
  background_0 = "#282828",
  background_1 = "#3c3836",
  background_2 = "#504945",
  background_3 = "#665c54",
  background_4 = "#7c6f64",
  foreground = "#ebdbb2",
  foreground_0 = "#fbf1c7",
  foreground_1 = "#ebdbb2",
  foreground_2 = "#d5c4a1",
  foreground_3 = "#bdae93",
  foreground_4 = "#a89984",
  red = "#cc241d",
  red_light = "#fb4934",
  green = "#98971a",
  light_green = "#b8bb26",
  yellow = "#d79921",
  light_yellow = "#fabd2f",
  blue = "#458588",
  light_blue = "#83a598",
  purple = "#b16286",
  light_purple = "#d3869b",
  aqua = "#689d6a",
  light_aqua = "#8ec07c",
  orange = "#d65d0e",
  light_orange = "",
  dark_gray = "#928374",
  gray = "#928374",
  light_gray = "#a89984",
  white = "#ffffff",
}

function colors.apply_to_config(config)
  config.color_scheme = 'Gruvbox dark, hard (base16)'
  config.colors = {
    tab_bar = {
      active_tab = {
        bg_color = colors.aqua,
        fg_color = colors.white,
      },
      inactive_tab = {
        bg_color = colors.background_hard,
        fg_color = colors.foreground_4,
      },
      inactive_tab_hover = {
        bg_color = colors.background_0,
        fg_color = colors.foreground,
      },
      new_tab = {
        bg_color = colors.background_hard,
        fg_color = colors.light_green,
      },
      new_tab_hover = {
        bg_color = colors.background_0,
        fg_color = colors.light_green
      }
    }
  }
end

return colors
