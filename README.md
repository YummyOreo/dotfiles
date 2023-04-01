# Dotfiles for my linux laptop:
Warning!!: This are still VERY MUCH A WIP

## SSH KEYS:
in nushell run:
`ssh-agent -c | lines | first 2 | parse "setenv {name} {value};" | transpose -i -r -d | load-env`
then
`ssh-add ~/.ssh/id_rsa`

