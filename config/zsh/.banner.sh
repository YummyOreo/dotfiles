number=$(coreutils shuf -i 0-151 -n 1)
joke=$(cat $HOME/.devjokes.json | jq ".[${number}]")
print $joke | cowsay -W 50 --aurora -f koala
