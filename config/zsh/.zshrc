# Created by newuser for 5.9
source "$HOME/.cargo/env"
export PATH="$HOME/.local/share/bob/nvim-bin:/usr/libexec/imv:$PATH"
export EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
export GRAVEYARD="$HOME/.local/share/Trash/graveyard"

export ZSH="$HOME/.oh-my-zsh"

plugins=(git copyfile sudo web-search copypath battery debian copyfile sudo)

source $ZSH/oh-my-zsh.sh

eval "$(starship init zsh)"

alias vim="nvim"
alias ll="exa -la"
alias ls="exa -a"

bindkey -s ^f "$HOME/scripts/tmux-sessionizer\n"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# BANNER
# cowsay --aurora -n -f koala "Zsh is the best!"
source "$HOME/.banner.sh"

# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/plugins/zsh/zsh-autocomplete/zsh-autocomplete.plugin.zsh

export GPG_TTY=$(tty)

# Priority

eval "$(atuin init zsh)"
eval "$(zoxide init zsh --cmd cd)"
