
def explorer_big [size = 4] {
    ps | where cpu > $size | where name == "explorer.exe"
}

def current-shell [] {
    shells # Get all shells
        | update path {|row index| $row.path | path-pretty } # Cut paths into readable chunks
        | each { |it|
                if ($it.active) { # Add different colors to active and other shells
                    $'(ansi reset)(ansi "#458588")($it.path)(ansi reset)'
                } else {
                    $'(ansi reset)(ansi "#7C6F64")($it.path)(ansi reset)'
                }

        }
        | str join $'(ansi "#665C64")|(ansi reset)' # Add separator
}

def path-pretty [] {
    let path = $in
    let home = $env.USERPROFILE
    let link = $"($path)"

    let text = if ($path | str starts-with $home) or ($path | str starts-with 'D:\Desktop 2') { # Check if path can be shortened with '~'
            $path | str replace --string $home '~' | str replace 'D:\\Desktop 2' 'D~'
        } else {
            $path
        }
    let paths = ($text | path split)
    mut good = ($paths | last 3)
    if ($paths | first 1) != ($good | first 1) {
        $good = ($good | update 0 "..\\")
        $good = ($good | prepend ($paths | first 1))
    }
    # let text = ($text | path split | last 3 | path join ) # Limit to three top directories
    let text = ($good | path join ) # Limit to three top directories
    ($link | ansi link --text $text) # Add a clicable link
}

def prompt-inject-shell [] {
    $in | str replace --string '[!shell-info!]' (current-shell) | $in + $"(ansi title)($env.PWD | path-pretty-no-link)(ansi st)"
}

def create_left_prompt [] {
    let starship_prompt = (starship prompt --cmd-duration $env.CMD_DURATION_MS $'--status=($env.LAST_EXIT_CODE)')
    $starship_prompt | prompt-inject-shell
}

#Function to extract archives with different extensions
export def extract [name:string #name of the archive to extract
] {
  let exten = [ [ex com];
                    ['.tar.bz2' 'tar xjf']
                    ['.tar.gz' 'tar xzf']
                    # ['.bz2' 'bunzip2']
                    ['.rar' 'unrar x']
                    ['.tbz2' 'tar xjf']
                    ['.tgz' 'tar xzf']
                    ['.zip' 'unzip']
                    # ['.7z' '/usr/bin/7z x']
                    # ['.deb' 'ar x']
                    ['.tar.xz' 'tar xvf']
                    ['.tar.zst' 'tar xvf']
                    ['.tar' 'tar xvf']
                    # ['.gz' 'gunzip']
                    # ['.Z' 'uncompress']
                    ]
  let command = ($exten|where $name =~ $it.ex|first)
  if ($command|is-empty) {
    echo 'Error! Unsupported file extension'
  } else {
    nu -c ($command.com + ' ' + $name)
  }
}


def "cargo list" [] {
    cargo install --list
    | lines
    | str replace '^(\w)' "\n${1}"
    | str join
    | lines | skip 1
    | parse --regex '(?<pkg>.*) v(?<version>\d+\.\d+\.\d+)(?<path>.*):(?<bins>.*)'
    | str trim
    | update bins {|it| $it.bins | str replace '\s+' ' ' | split row ' '}
    | update path {|it| $it.path | str replace --string '(' '' | str replace --string ')' ''}
}

def every [duration: duration, closure: closure] {
  0.. | each { |it|
    # pass iteration number as both `$in` and first positional argument
    let ret = ($it | do $closure $it)
    sleep $duration
    $ret
  }
}

def "top rust" [] {
    echo "does not work rn"
# http get https://github.com/trending/rust?since=daily
# | query web -q '.float-sm-right , .lh-condensed a'
# | str trim
# | str replace ' /\n\n      ' '/'
# | group 2
# | each {|r| {
#     site: ($"https://github.com/($r.0)" | ansi link --text $r.0)
#     stars: ($r.1 | str replace ' stars today' '' | str replace ',' '' | into int)
# }}
# | sort-by stars -r
# | table -n 1
}

# scoop-search wrapper (50x faster)
def "scoop search" [
    term:string # the term to search for
] {
    ^scoop-search $term | parse -r '\s*(.*)\s*\((.*)\)' | rename package version
}

def colors [txt:string] {
  [black red yellow orange green cyan blue purple white] |
  each {|c| do -i {print -n $"(ansi $c)($txt)"}}
}

def cwall [] {
  let sep = $"(char nf_right_segment)(char nf_left_segment)"
  colors $sep
  ansi bb
  colors $sep
}

def "list todos" [] {
    rg "//.? ?TODO" . -n
    | lines
    | parse "{file}:{line}:{match}"
    | try {
        group-by file
        | transpose
        | reject column1.file
        | transpose -rid
    } catch {
        "no TODOs found in this directory"
    }
}

def "cargo info full" [
    crate: string
] {
    cargo info $crate
    | lines
    | parse "{key}: {value}"
    | str trim
    | transpose -r
    | into record
    | merge ({
        versions: (
            cargo info $crate -VV
            | lines -s
            | skip 1
            | parse --regex '(?<version>\d+\.\d+\.\d+)\s+(?<released>.* ago)\s+(?<downloads>\d+)'
            | into int downloads
        )
    })
}

def "into hex" [] {
    fmt | get lowerhex
}

def "just-cmd" [] {
 # check if justfile exists first
 if (("./.justfile" | path exists) or ("./justfile" | path exists)) {
    return (just --list  | lines | str trim | skip 1 | parse "{value}")
}
echo "none"
return []
}

export extern "just" [
   cmd?:string@"just-cmd"
   --list # list all commands
]
