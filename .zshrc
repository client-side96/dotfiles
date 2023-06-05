source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

# Antigen packages
source $HOME/.config/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

antigen apply

# Aliases
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='exa --icons'
alias ll='ls -l -g'
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# PATH
export PATH=$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.config/emacs/bin:$HOME/.ghcup/bin:/usr/local/go/bin:$HOME/.cabal/bin:$PATH
export GOPATH=$HOME/go

# exports & evals
export EDITOR='vim'
export HELIX_RUNTIME=$HOME/pkg/helix/runtime

# Starship shell
eval "$(starship init zsh)"

# Node version manager
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
