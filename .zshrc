# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

# Antigen packages
source $HOME/.config/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen theme romkatv/powerlevel10k

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
export EDITOR='hx'
export HELIX_RUNTIME=$HOME/pkg/helix/runtime

# Starship shell
# eval "$(starship init zsh)"

# Powerlevel 10k (Configure with `p10k configure`)
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

