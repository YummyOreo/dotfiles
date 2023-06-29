[ "$(tty)" = "/dev/tty1" ] && exec sway
source "$HOME/.cargo/env"
echo "loginshell"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
