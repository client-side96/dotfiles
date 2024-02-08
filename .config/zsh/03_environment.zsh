# PATH
export GEM_HOME=$HOME/.gems
export PATH=$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.config/emacs/bin:$HOME/.ghcup/bin:/usr/local/go/bin:$HOME/.cabal/bin:$HOME/.local/bin:/usr/local/android-studio/bin:/usr/local/flutter/bin:/usr/local/cmdline-tools/latest/bin:/usr/local/bin/omnisharp:$HOME/fvm/default/bin:$GEM_HOME/bin:$HOME/.gem/ruby/2.6.0/bin:$PATH
export GOPATH=$HOME/go

# exports & evals
export EDITOR='hx'
export HELIX_RUNTIME=$HOME/pkg/helix/runtime

export LC_ALL=en_US.UTF-8


# export NODE_EXTRA_CA_CERTS="$HOME/certs/franka-ca.crt"

# Node version manager
# TODO: fix because blocks loading
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/home/frey_do/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(rbenv init - zsh)"
