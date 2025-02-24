. "$HOME/.cargo/env"

export EDITOR='nvim'
export HELIX_RUNTIME=$HOME/pkg/helix/runtime

export GEM_HOME=$HOME/.gem

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export ANDROID_HOME=/Users/mvst/Library/Android/sdk

export PATH=$GEM_HOME/bin:$GEM_HOME/ruby/3.0.0/bin:/usr/local/flutter/bin:$HOME/fvm/default/bin:$GEM_HOME/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.pub-cache/bin:/opt/homebrew/opt/openjdk@17/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin:$PATH
export LANG=en_US.UTF-8

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"

export XDG_CONFIG_HOME="$HOME/.config"
