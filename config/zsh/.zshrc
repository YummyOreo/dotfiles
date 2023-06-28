# Created by newuser for 5.9
source "$HOME/.cargo/env"
export PATH="$HOME/.local/share/bob/nvim-bin:/usr/libexec/imv:$PATH"
export EDITOR="$HOME/.local/share/bob/nvim-bin/nvim"
export GRAVEYARD="$HOME/.local/share/Trash/graveyard"

eval "$(starship init zsh)"

alias vim="nvim"
alias ll="exa -la"
alias ls="exa -a"

bindkey -s ^f "$HOME/scripts/tmux-sessionizer\n"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# BANNER
# cowsay --aurora -n -f koala "Zsh is the best!"
source "$HOME/.banner.sh"

export GPG_TTY=$(tty)

# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.local/share/shell_plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Priority

eval "$(atuin init zsh)"
eval "$(zoxide init zsh --cmd cd)"
