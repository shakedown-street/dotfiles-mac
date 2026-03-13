# completion

autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select

# zoxide
# NOTE: zoxide must be placed after compinit which is why it's here instead of zprofile

eval "$(zoxide init zsh)"

# prompt

autoload -Uz vcs_info

setopt PROMPT_SUBST

precmd() {
  vcs_info
}

zstyle ":vcs_info:git:*" formats " (%b)"
zstyle ":vcs_info:git:*" actionformats " (%b|%a)"

PROMPT="%F{green}%n@%m%f:%F{blue}%~%f%F{yellow}\${vcs_info_msg_0_}%f $ "

# aliases

alias reload="source $HOME/.zshrc"
alias ls="ls -G"
alias ll="ls -lhG"
alias la="ls -lhaG"
alias grep="grep --color=auto"
alias gs="git status"
alias gcg="git config --edit --global"
alias gcl="git config --edit --local"
alias vim="nvim"

# load machine-specific config if it exists

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
