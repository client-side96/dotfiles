local wezterm = require 'wezterm'

local project_dir = wezterm.home_dir .. '/devel'

local mobile_app_dir = project_dir .. '/care/app-mobile'
local middleware_dir = project_dir .. '/care/app-middleware'
local virtual_coach_dir = project_dir .. '/care/virtual-coach-app'
local deployment_dir = project_dir .. '/care/app-middleware-deployment'

local code_projects = {
  ["care-mobile"] = mobile_app_dir,
  ["care-middleware"] = middleware_dir,
  ["care-va"] = virtual_coach_dir,
  ["care-deployment"] = deployment_dir,
}

return code_projects
