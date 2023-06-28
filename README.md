# WARNING:
Running `./linkscripts.bash` or `./linkdotfiles.bash` will delete the corresponding folders in your home dir.

# KNOWN PROBLEMS
- installed.md is not up to date
- zshrc does not work

# Commands
## swaymsg
- `swaymsg -t aet_tree`: Get a list of current windows / class names:
## bluetoothctl
Run bluetoothctl and it will take you into a "shell", run help to see all commands:
- `trust`: add device to trusted list
- `connect`: connect a device
- `scan on`: see all devices
- `devices Trusted`: show all trusted devices
- `devices Connected`: show all connected devices
## pw-cli
- `pw-cli ls Node` list of nodes and their info stuff
- `pw-cli ls Device` list all devices and their info stuff
## tmux:
See https://tmuxcheatsheet.com/
## exa
Just like ls
## bob-nvim
Run `bob-nvim use stable` to update neovim
## gh
Todo
## lux
`lux <url>`
## tldr
`tldr <command>`

# How to get useful info
## Battery precentage
run `upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep 'percentage'`
## Get class of a window/program
run `swaymsg -t aet_tree`
## Get all pipewire nodes/devices
- `pw-cli ls Node`
- `pw-cli ls Device`

# Keybindings
## zsh
- `ctl+f` open `./scripts/tmux-sessionizer` (fzf over projects and then open a tmux session in the dir)

## Connect to network
- `nmcli d wifi list` to list all networks
- `nmcli d wifi connect <ssid> password "<password>"` to connect to wifi
