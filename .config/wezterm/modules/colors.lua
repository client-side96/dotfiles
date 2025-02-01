local colors = {
  base = '#faf4ed',
  surface = '#fffaf3',
  overlay = '#f2e9e1',
  muted = '#9893a5',
  subtle = '#797593',
  text = '#575279',
  red = '#b4637a',
  yellow = '#ea9d34',
  rose = '#d7827e',
  green = '#286983',
  blue = '#56949f',
  magenta = '#907aa9',
  highlight_low = '#f4ede8',
  highlight_med = '#dfdad9',
  highlight_high = '#cecacd',
  white = '#ffffff'
}

function colors.apply_to_config(config)
    config.color_scheme = "Github Dark (Gogh)"
end

return colors
