local wezterm = require 'wezterm'

local project_dir = wezterm.home_dir .. '/devel'

local locksmith_dir = wezterm.home_dir .. '/clientside/locksmith'

local code_projects = {
  ["locksmith"] = locksmith_dir,
}

return code_projects
