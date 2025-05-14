# NEOVIM CONFIGURATION CONTEXT

## Overview

This is a minimal Neovim configuration that prioritizes built-in functionality over plugins when reasonable. It uses Lua for configuration and maintains a modular structure.

## Core Principles

- Minimize plugin usage when Lua implementations are feasible
- Prefer Lua over VimScript
- Maintain clean, modular organization
- Optimize for performance and startup time
- Use intuitive keybindings

## Directory Structure

- `init.lua`: Main configuration entry point
- `lua/client-side/`: Core settings
  - `options.lua`: Neovim options and settings
  - `keymaps.lua`: Key mappings
- `lua/plugins/`: Plugin configurations

## Configuration Approach

The configuration is always structured the same. The `lua/plugins` directory contains subdirectories for each plugin or plugin group. Each plugin directory has a `init.lua` where the plugin and its dependencies are defined and installed. And a `config.lua` where the plugin or plugin groups configuration is defined.

## Common Tasks

- Plugin configuration and management
- Keybinding setup
- UI customization
- LSP configuration
- Autocompletion settings
- Custom functionality implementation

## Technical Details

- Targets Neovim 0.11+ features
- Uses Lua API for configuration
- Implements custom functionality through Lua modules
