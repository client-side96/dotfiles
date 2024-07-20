local wezterm = require 'wezterm'

local project_dir = wezterm.home_dir .. '/devel/care'
local mobile_app_dir = project_dir .. '/app-mobile'
local middleware_dir = project_dir .. '/app-middleware'
local virtual_coach_dir = project_dir .. '/virtual-coach-app'
local deployment_dir = project_dir .. '/app-middleware-deployment'

local projects = {
  ["care-mobile"] = mobile_app_dir,
  ["care-middleware"] = middleware_dir,
  ["care-va"] = virtual_coach_dir,
  ["care-deployment"] = deployment_dir,
}

return projects
