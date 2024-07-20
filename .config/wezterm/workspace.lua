local wezterm = require 'wezterm'
local mux = wezterm.mux

local workspace = {}

function workspace.setup_dotfiles(first_dot, second_dot)
  local tab, pane, window = mux.spawn_window {
    workspace = "dotfiles",
    cwd = wezterm.home_dir,
  }

  local pane_2 = pane:split {
    workspace = "dotfiles",
    cwd = wezterm.home_dir,
    size = 0.5,
    direction = "Right"
  }
  pane:activate()
  pane:send_text ('hx ' .. first_dot .. '\n')
  pane_2:send_text ('hx ' .. second_dot .. '\n')

  return window
end

function workspace.setup_ssh_project(host, prefix)
  local tab, pane, window = mux.spawn_window {
    workspace = "ssh-" .. host
  }
  tab:set_title (prefix .. ' Connection: ' .. host)
  pane:send_text ('ssh ' .. host .. '\n')

  return window
end

function workspace.setup_code_project(workspace, cwd)
  local editor_tab, editor_pane, window = mux.spawn_window {
    workspace = workspace,
    cwd = cwd,
  }
  editor_tab:set_title '🔎 Editor'
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
  git_tab:set_title '🌳 Git'

  editor_pane:activate()
  editor_pane:send_text 'hx\n'
  git_pane:send_text 'lazygit\n'
  return window
end

return workspace
