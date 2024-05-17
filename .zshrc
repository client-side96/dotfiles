# Antigen packages
source $HOME/.config/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
anitgen bundle nvm
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle larkery/zsh-histdb
antigen bundle zsh-users/zsh-autosuggestions

antigen apply


# Aliases
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='exa --icons'
alias ll='ls -l -g'
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias lzg='lazygit'
alias lzd='lazydocker'

# PATH
export GEM_HOME=$HOME/.gems
export PATH=$HOME/bin:$HOME/.cargo/bin:$HOME/go/bin:$HOME/.config/emacs/bin:$HOME/.ghcup/bin:/usr/local/go/bin:$HOME/.cabal/bin:$HOME/.local/bin:/usr/local/android-studio/bin:/usr/local/flutter/bin:/usr/local/cmdline-tools/latest/bin:/usr/local/bin/omnisharp:$HOME/fvm/default/bin:$GEM_HOME/bin:$HOME/.gem/ruby/2.6.0/bin:$HOME/.pub-cache/bin:$PATH
export GOPATH=$HOME/go

# exports & evals
export EDITOR='hx'
export HELIX_RUNTIME=$HOME/pkg/helix/runtime

export LC_ALL=en_US.UTF-8

# pnpm
export PNPM_HOME="/home/frey_do/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/mvst/.dart-cli-completion/zsh-config.zsh ]] && . /Users/mvst/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"
eval "$(starship init zsh)"

