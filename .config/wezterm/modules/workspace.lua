local wezterm = require 'wezterm'
local mux = wezterm.mux

local code_projects = require 'env.code_projects'
local ssh_projects = require 'env.ssh_projects'

local dotfiles_project = 'dotfiles'
local notes_project = 'notes'

local editor_cmd = 'hx'
local git_cmd = 'lazygit'
local ssh_cmd = 'ssh'
local md_cmd = 'glow'

local function setup_notes()
  local tab, pane, window = mux.spawn_window {
    workspace = notes_project,
    cwd = wezterm.home_dir,
  }

  pane:send_text(md_cmd .. ' ' .. '~/notes/\n')

  return window
end

local function setup_dotfiles()
  local tab, pane, window = mux.spawn_window {
    workspace = dotfiles_project,
    cwd = wezterm.home_dir,
  }

  pane:send_text(editor_cmd .. ' ' .. '~/.config/wezterm/\n')

  return window
end

local function setup_ssh_project(host, prefix)
  local tab, pane, window = mux.spawn_window {
    workspace = "ssh-" .. host
  }
  tab:set_title(prefix .. ' Connection: ' .. host)
  pane:send_text(ssh_cmd .. ' ' .. host .. '\n')

  return window
end

local function setup_code_project(workspace, cwd)
  local editor_tab, editor_pane, window = mux.spawn_window {
    workspace = workspace,
    cwd = cwd,
  }
  editor_tab:set_title ' Editor'
  local build_pane = editor_pane:split {
    workspace = workspace,
    direction = 'Bottom',
    size = 0.2,
    cwd = cwd,
  }
  local git_tab, git_pane, _ = window:spawn_tab {
    workspace = workspace,
    cwd = cwd,
  }
  git_tab:set_title '󰊢 Git'

  editor_pane:activate()
  editor_pane:send_text(editor_cmd .. '\n')
  git_pane:send_text(git_cmd .. '\n')
  return window
end


local workspace = {}

function workspace.init()
  -- local window = setup_dotfiles()

  -- window:gui_window():maximize()

  -- setup_notes()

  -- for name, dir in pairs(code_projects) do
  --   setup_code_project(name, dir)
  -- end

  -- for host, marker in pairs(ssh_projects) do
  --   setup_ssh_project(host, marker)
  -- end

  -- mux.set_active_workspace(dotfiles_project)
end

return workspace
