# Antigen packages
source $HOME/.config/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle nvm
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle larkery/zsh-histdb
antigen bundle zsh-users/zsh-autosuggestions

antigen apply


# Aliases
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ls='eza --icons'
alias ll='ls -l -g'
alias dot='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias v='nvim'

alias lzg='lazygit'
alias lzd='lazydocker'

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/mvst/.dart-cli-completion/zsh-config.zsh ]] && . /Users/mvst/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(rbenv init - --no-rehash bash)"


# Added by Windsurf
export PATH="/Users/frey_do/.codeium/windsurf/bin:$PATH"
