# increase history size
HISTSIZE=100000
SAVEHIST=100000

# home bin
export PATH="$HOME/bin:$PATH"

# editor
export EDITOR="hx"
export VISUAL="hx"

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

# fzf
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

# this is just here so that lazygit finds the config file in ~/.config
export XDG_CONFIG_HOME="$HOME/.config"

# completion
autoload -Uz compinit
compinit -C

zstyle ':completion:*' menu select

# zoxide
# NOTE: zoxide must be placed after compinit
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
alias man="batman"
alias gs="git status"
alias gcg="git config --edit --global"
alias gcl="git config --edit --local"
alias ide="zellij --layout ~/.config/zellij/layouts/ide.kdl"

# silly aliases
alias marsha="pbcopy < $HOME/marsha.txt"

# alias --help to use bat
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# a useful search function that pipes rg output to fzf and opens selection in helix at exact line
seer() {
    rg --line-number --no-heading --color=always "$@" \
    | fzf --ansi --delimiter ':' \
        --height "100%" --layout reverse --border \
        --preview 'bat --style=numbers --color=always {1} --highlight-line {2}' \
        --bind 'enter:execute(hx {1}:{2})'
}
