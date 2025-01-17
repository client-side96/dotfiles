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
    config.color_scheme = "Vs Code Dark+ (Gogh)"
    -- config.colors = {
  --   -- The default text color
  --   foreground = '#ebeafa',
  --   -- The default background color
  --   background = '#3b224c',

  --   -- Overrides the cell background color when the current cell is occupied by the
  --   -- cursor and the cursor style is set to Block
  --   cursor_bg = '#eaeaea',
  --   -- Overrides the text color when the current cell is occupied by the cursor
  --   cursor_fg = 'black',

  --   -- The color of the split lines between panes
  --   split = '#dbbfef',

  --   ansi = {
  --     '#3b224c',
  --     '#f47868',
  --     '#9ff28f',
  --     '#efba5d',
  --     '#a4a0e8',
  --     '#dbbfef',
  --     '#6acdca',
  --     '#ebeafa',
  --   },
  --   brights = {
  --     '#697c81',
  --     '#ff3334',
  --     '#9ec400',
  --     '#e7c547',
  --     '#7aa6da',
  --     '#b77ee0',
  --     '#54ced6',
  --     '#ffffff',
  --   },

  --   -- Arbitrary colors of the palette in the range from 16 to 255
  --   indexed = { [136] = '#af8700' },

  -- }
  -- config.colors = {
  --   tab_bar = {
  --     active_tab = {
  --       bg_color = colors.green,
  --       fg_color = colors.white,
  --     },
  --     inactive_tab = {
  --       bg_color = colors.base,
  --       fg_color = colors.text,
  --     },
  --     inactive_tab_hover = {
  --       bg_color = colors.overlay,
  --       fg_color = colors.text,
  --     },
  --     new_tab = {
  --       bg_color = colors.base,
  --       fg_color = colors.text,
  --     },
  --     new_tab_hover = {
  --       bg_color = colors.overlay,
  --       fg_color = colors.text
  --     }
  --   }
  -- }
end

return colors
