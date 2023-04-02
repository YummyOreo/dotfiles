mut paper = (open ~/.config/hypr/wallpapers/paper.toml)

let active = ($paper | get "active")
let index = ($paper | get "index")
let wallpapers = ($paper | get "wallpapers")

let max = ($wallpapers | length)

mut next_index = (random integer 0..$max)
print $next_index

if $next_index == $max {
    $next_index = 0
}

let $next_active = ($wallpapers | get $next_index)

let file = (^echo $"~/.config/hypr/wallpapers/($next_active)")
let file = (ls $"~/.config/hypr/wallpapers/($next_active)" | get 0.name)
echo $file
# cat $file
cp $file "~/.config/hypr/wallpapers/active.jpg"

$paper.active = $next_active
$paper.index = $next_index

$paper | save "~/.config/hypr/wallpapers/paper.toml" -f

swaybg -m fill -i ~/.config/hypr/wallpapers/active.jpg
