def path-pretty-no-link [] {
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
    ($good | path join ) # Limit to three top directories
}

# Nushell Config File
module completions {
# Custom completions for external commands (those outside of Nushell)
# Each completions has two parts: the form of the external command, including its flags and parameters
# and a helper command that knows how to complete values for those flags and parameters
#
# This is a simplified version of completions for git branches and git remotes
    def "nu-complete git branches" [] {
        ^git branch | lines | each { |line| $line | str replace '[\*\+] ' '' | str trim }
    }

    def "nu-complete git remotes" [] {
        ^git remote | lines | each { |line| $line | str trim }
    }

# Download objects and refs from another repository
    export extern "git fetch" [
        repository?: string@"nu-complete git remotes" # name of the repository to fetch
            branch?: string@"nu-complete git branches" # name of the branch to fetch
            --all                                         # Fetch all remotes
            --append(-a)                                  # Append ref names and object names to .git/FETCH_HEAD
            --atomic                                      # Use an atomic transaction to update local refs.
            --depth: int                                  # Limit fetching to n commits from the tip
            --deepen: int                                 # Limit fetching to n commits from the current shallow boundary
            --shallow-since: string                       # Deepen or shorten the history by date
            --shallow-exclude: string                     # Deepen or shorten the history by branch/tag
            --unshallow                                   # Fetch all available history
            --update-shallow                              # Update .git/shallow to accept new refs
            --negotiation-tip: string                     # Specify which commit/glob to report while fetching
            --negotiate-only                              # Do not fetch, only print common ancestors
            --dry-run                                     # Show what would be done
            --write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
            --no-write-fetch-head                         # Do not write FETCH_HEAD
            --force(-f)                                   # Always update the local branch
            --keep(-k)                                    # Keep downloaded pack
            --multiple                                    # Allow several arguments to be specified
            --auto-maintenance                            # Run 'git maintenance run --auto' at the end (default)
            --no-auto-maintenance                         # Don't run 'git maintenance' at the end
            --auto-gc                                     # Run 'git maintenance run --auto' at the end (default)
            --no-auto-gc                                  # Don't run 'git maintenance' at the end
            --write-commit-graph                          # Write a commit-graph after fetching
            --no-write-commit-graph                       # Don't write a commit-graph after fetching
            --prefetch                                    # Place all refs into the refs/prefetch/ namespace
            --prune(-p)                                   # Remove obsolete remote-tracking references
            --prune-tags(-P)                              # Remove any local tags that do not exist on the remote
            --no-tags(-n)                                 # Disable automatic tag following
            --refmap: string                              # Use this refspec to map the refs to remote-tracking branches
            --tags(-t)                                    # Fetch all tags
            --recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
            --jobs(-j): int                               # Number of parallel children
            --no-recurse-submodules                       # Disable recursive fetching of submodules
            --set-upstream                                # Add upstream (tracking) reference
            --submodule-prefix: string                    # Prepend to paths printed in informative messages
            --upload-pack: string                         # Non-default path for remote command
            --quiet(-q)                                   # Silence internally used git commands
            --verbose(-v)                                 # Be verbose
            --progress                                    # Report progress on stderr
            --server-option(-o): string                   # Pass options for the server to handle
            --show-forced-updates                         # Check if a branch is force-updated
            --no-show-forced-updates                      # Don't check if a branch is force-updated
            -4                                            # Use IPv4 addresses, ignore IPv6 addresses
            -6                                            # Use IPv6 addresses, ignore IPv4 addresses
            --help                                        # Display the help message for this command
            ]

# Check out git branches and files
            export extern "git checkout" [
            ...targets: string@"nu-complete git branches"   # name of the branch or files to checkout
                --conflict: string                              # conflict style (merge or diff3)
                --detach(-d)                                    # detach HEAD at named commit
                --force(-f)                                     # force checkout (throw away local modifications)
                --guess                                         # second guess 'git checkout <no-such-branch>' (default)
                --ignore-other-worktrees                        # do not check if another worktree is holding the given ref
                --ignore-skip-worktree-bits                     # do not limit pathspecs to sparse entries only
                --merge(-m)                                     # perform a 3-way merge with the new branch
                --orphan: string                                # new unparented branch
                --ours(-2)                                      # checkout our version for unmerged files
                --overlay                                       # use overlay mode (default)
                --overwrite-ignore                              # update ignored files (default)
                --patch(-p)                                     # select hunks interactively
                --pathspec-from-file: string                    # read pathspec from file
                --progress                                      # force progress reporting
                --quiet(-q)                                     # suppress progress reporting
                --recurse-submodules: string                    # control recursive updating of submodules
                --theirs(-3)                                    # checkout their version for unmerged files
                --track(-t)                                     # set upstream info for new branch
                -b: string                                      # create and checkout a new branch
                -B: string                                      # create/reset and checkout a branch
                -l                                              # create reflog for new branch
                --help                                          # Display the help message for this command
                ]

# Push changes
                export extern "git push" [
                remote?: string@"nu-complete git remotes",      # the name of the remote
                    ...refs: string@"nu-complete git branches"      # the branch / refspec
                    --all                                           # push all refs
                    --atomic                                        # request atomic transaction on remote side
                    --delete(-d)                                    # delete refs
                    --dry-run(-n)                                   # dry run
                    --exec: string                                  # receive pack program
                    --follow-tags                                   # push missing but relevant tags
                    --force(-f)                                     # force updates
                    --ipv4(-4)                                      # use IPv4 addresses only
                    --ipv6(-6)                                      # use IPv6 addresses only
                    --mirror                                        # mirror all refs
                    --no-verify                                     # bypass pre-push hook
                    --porcelain                                     # machine-readable output
                    --progress                                      # force progress reporting
                    --prune                                         # prune locally removed refs
                    --push-option(-o): string                       # option to transmit
                    --quiet(-q)                                     # be more quiet
                    --receive-pack: string                          # receive pack program
                    --recurse-submodules: string                    # control recursive pushing of submodules
                    --repo: string                                  # repository
                    --set-upstream(-u)                              # set upstream for git pull/status
                    --signed: string                                # GPG sign the push
                    --tags                                          # push tags (can't be used with --all or --mirror)
                    --thin                                          # use thin pack
                    --verbose(-v)                                   # be more verbose
                    --help                                          # Display the help message for this command
                    ]
}

# Get just the extern definitions without the custom completion commands
use completions *

# For more information on themes, see
# https://www.nushell.sh/book/coloring_and_theming.html
let dark_theme = {
# color for nushell primitives
separator: '#EBDBB2'
               leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
               header: '#FE8019'
               empty: '#458588'
# Closures can be used to choose colors for specific values.
# The value (in this case, a bool) is piped into the closure.
               bool: {|| if $in { '#84A598' } else { '#928374' } }
int: '#EBDBB2'
         filesize: {|e|
             if $e == 0b {
                 '#EBDBB2'
             } else if $e < 1mb {
                 '#FE8019'
             } else if $e < 1mb {
                 '#D79921'
             } else { '#FABD2F' }
         }
duration: '#EBDBB2'
              date: {|| (date now) - $in |
                  if $in < 1hr {
                      '#8EC07C'
                  } else if $in < 6hr {
                      '#FE8019'
                  } else if $in < 1day {
                      '#B8BB26'
                  } else if $in < 3day {
                      '#689D6A'
                  } else if $in < 1wk {
                      '#B16286'
                  } else if $in < 6wk {
                      '#458588'
                  } else if $in < 52wk {
                      '#7C6F64'
                  } else { '#665C54' }
              }
range: '#EBDBB2'
           float: '#EBDBB2'
           string: '#EBDBB2'
           nothing: '#EBDBB2'
           binary: '#EBDBB2'
           cellpath: '#EBDBB2'
           row_index: '#FE8019'
           record: '#EBDBB2'
           list: '#EBDBB2'
           block: '#EBDBB2'
           hints: '#665C54'

           shape_and: {fg: '#B16286', attr: b}
shape_binary: {fg: '#B16286', attr: b}
shape_block: {fg: '#458588', attr: b}
shape_bool: '#689D6A'
                shape_custom: '#B8BB26'
                shape_datetime: {fg: '#689D6A', attr: b}
shape_directory: '#458588'
                     shape_external: '#689D6A'
                     shape_externalarg: '#8EC07C'
                     shape_filepath: '#FE8019'
                     shape_flag: {fg: '#458588', attr: b}
shape_float: {fg: '#B16286', attr: b}
# shapes are used to change the cli syntax highlighting
shape_garbage: { fg: "#EBDBB2" bg: "#CC241D" attr: b}
shape_globpattern: {fg: '#689D6A', attr: b}
shape_int: {fg: '#B16286', attr: b}
shape_internalcall: {fg: '#689D6A', attr: b}
shape_list: {fg: '#689D6A', attr: b}
shape_literal: '#458588'
                   shape_matching_brackets: { attr: u }
shape_nothing: '#8EC07C'
                   shape_operator: '#FE8019'
                   shape_or: '#FE8019'
                   shape_pipe: '#FE8019'
                   shape_range: {fg: '#D79921', attr: b}
shape_record: {fg: '#689D6A', attr: b}
shape_redirection: {fg: '#B16286', attr: b}
shape_signature: '#FE8019'
                     shape_string: '#B8BB26'
                     shape_string_interpolation: {fg: '#689D6A', attr: b}
shape_table: {fg: '#458588', attr: b}
shape_variable: '#B16286'
}

let light_theme = {
# color for nushell primitives
separator: dark_gray
               leading_trailing_space_bg: { attr: n } # no fg, no bg, attr none effectively turns this off
               header: green_bold
               empty: blue
# Closures can be used to choose colors for specific values.
# The value (in this case, a bool) is piped into the closure.
               bool: {|| if $in { 'dark_cyan' } else { 'dark_gray' } }
int: dark_gray
         filesize: {|e|
             if $e == 0b {
                 'dark_gray'
             } else if $e < 1mb {
                 'cyan_bold'
             } else { 'blue_bold' }
         }
duration: dark_gray
              date: {|| (date now) - $in |
                  if $in < 1hr {
                      'red3b'
                  } else if $in < 6hr {
                      'orange3'
                  } else if $in < 1day {
                      'yellow3b'
                  } else if $in < 3day {
                      'chartreuse2b'
                  } else if $in < 1wk {
                      'green3b'
                  } else if $in < 6wk {
                      'darkturquoise'
                  } else if $in < 52wk {
                      'deepskyblue3b'
                  } else { 'dark_gray' }
              }
range: dark_gray
           float: dark_gray
           string: dark_gray
           nothing: dark_gray
           binary: dark_gray
           cellpath: dark_gray
           row_index: green_bold
           record: white
           list: white
           block: white
           hints: dark_gray

           shape_and: purple_bold
           shape_binary: purple_bold
           shape_block: blue_bold
           shape_bool: light_cyan
           shape_custom: green
           shape_datetime: cyan_bold
           shape_directory: cyan
           shape_external: cyan
           shape_externalarg: green_bold
           shape_filepath: cyan
           shape_flag: blue_bold
           shape_float: purple_bold
# shapes are used to change the cli syntax highlighting
           shape_garbage: { fg: "#FFFFFF" bg: "#FF0000" attr: b}
shape_globpattern: cyan_bold
                       shape_int: purple_bold
                       shape_internalcall: cyan_bold
                       shape_list: cyan_bold
                       shape_literal: blue
                       shape_matching_brackets: { attr: u }
shape_nothing: light_cyan
                   shape_operator: yellow
                   shape_or: purple_bold
                   shape_pipe: purple_bold
                   shape_range: yellow_bold
                   shape_record: cyan_bold
                   shape_redirection: purple_bold
                   shape_signature: green_bold
                   shape_string: green
                   shape_string_interpolation: cyan_bold
                   shape_table: blue_bold
                   shape_variable: purple
}

# External completer example
# let carapace_completer = {|spans|
#     carapace $spans.0 nushell $spans | from json
# }


# The default config record. This is where much of your global configuration is setup.
let-env config = {
# show_banner: false
shell_integration: false,
                   ls: {
use_ls_colors: true # use the LS_COLORS environment variable to colorize output
                   clickable_links: true # enable or disable clickable links. Your terminal has to support links.
                   }
rm: {
always_trash: false # always act as if -t was given. Can be overridden with -p
    }
cd: {
abbreviations: false # allows `cd s/o/f` to expand to `cd some/other/folder`
    }
table: {
mode: rounded # basic, compact, compact_double, light, thin, with_love, rounded, reinforced, heavy, none, other
          index_mode: always # "always" show indexes, "never" show indexes, "auto" = show indexes when a table has "index" column
          trim: {
methodology: wrapping # wrapping or truncating
                 wrapping_try_keep_words: true # A strategy used by the 'wrapping' methodology
                 truncating_suffix: "..." # A suffix used by the 'truncating' methodology
          }
       }

explore: {
help_banner: true
                 exit_esc: true

                 command_bar_text: '#C4C9C6'
# command_bar: {fg: '#C4C9C6' bg: '#223311' }

                 status_bar_background: {fg: '#1D1F21' bg: '#C4C9C6' }
# status_bar_text: {fg: '#C4C9C6' bg: '#223311' }

highlight: {bg: 'yellow' fg: 'black' }

status: {
# warn: {bg: 'yellow', fg: 'blue'}
# error: {bg: 'yellow', fg: 'blue'}
# info: {bg: 'yellow', fg: 'blue'}
        }

try: {
# border_color: 'red'
# highlighted_color: 'blue'

# reactive: false
     }

table: {
split_line: '#404040'

                cursor: true

                line_index: true
                line_shift: true
                line_head_top: true
                line_head_bottom: true

                show_head: true
                show_index: true

# selected_cell: {fg: 'white', bg: '#777777'}
# selected_row: {fg: 'yellow', bg: '#C1C2A3'}
# selected_column: blue

# padding_column_right: 2
# padding_column_left: 2

# padding_index_left: 2
# padding_index_right: 1
       }

config: {
cursor_color: {bg: 'yellow' fg: 'black' }

# border_color: white
# list_color: green
        }
         }

history: {
max_size: 10000 # Session has to be reloaded for this to take effect
              sync_on_enter: true # Enable to share history between multiple sessions, else you have to close the session to write history to file
              file_format: "plaintext" # "sqlite" or "plaintext"
         }
completions: {
case_sensitive: false # set to true to enable case-sensitive completions
                    quick: true  # set this to false to prevent auto-selecting completions when only one remains
                    partial: true  # set this to false to prevent partial filling of the prompt
                    algorithm: "fuzzy"  # prefix or fuzzy
                    external: {
enable: true # set to false to prevent nushell looking into $env.PATH to find more suggestions, `false` recommended for WSL users as this look up my be very slow
            max_results: 100 # setting it lower can improve completion performance at the cost of omitting some options
            completer: null # check 'carapace_completer' above as an example
                    }
             }
filesize: {
metric: true # true => KB, MB, GB (ISO standard), false => KiB, MiB, GiB (Windows standard)
            format: "auto" # b, kb, kib, mb, mib, gb, gib, tb, tib, pb, pib, eb, eib, zb, zib, auto
          }
cursor_shape: {
emacs: block # block, underscore, line (line is the default)
           vi_insert: block # block, underscore, line (block is the default)
           vi_normal: underscore # block, underscore, line  (underscore is the default)
              }
color_config: $dark_theme   # if you want a light theme, replace `$dark_theme` to `$light_theme`
                  use_grid_icons: true
                  footer_mode: "25" # always, never, number_of_rows, auto
                  float_precision: 2 # the precision for displaying floats in tables
buffer_editor: "emacs" # command that will be used to edit the current line buffer with ctrl+o, if unset fallback to $env.EDITOR and $env.VISUAL
# buffer_editor: ["test", 1]
  use_ansi_coloring: true
  edit_mode: vi # emacs, vi
  # shell_integration: true # enables terminal markers and a workaround to arrow keys stop working issue
  # true or false to enable or disable the welcome banner at startup
  show_banner: false
  render_right_prompt_on_last_line: false # true or false to enable or disable right prompt to be rendered on last line of the prompt.

  hooks: {
    pre_prompt: {||
        # print echo $"(ansi title)($env.PWD | path-pretty-no-link)(ansi st)"
        null
    }
    pre_execution: {||
        if (commandline | str length) != 0 {
            print -n $"(ansi title)($env.PWD | path-pretty-no-link) | (commandline)(ansi st)"
        } else {
            print -n $"(ansi title)($env.PWD | path-pretty-no-link)(ansi st)"
        }
    }
    env_change: {
      PWD: [{|before, after|
      null
      }]
    }
    display_output: {|| if (term size).columns >= 100 { table -e } else { table }}
  }
  menus: [
      # Configuration for default nushell menus
      # Note the lack of source parameter
      {
        name: completion_menu
        only_buffer_difference: false
        marker: "| "
        type: {
            layout: columnar
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
        }
        style: {
            text: '#98971A'
            selected_text: {bg: '#98971A'}
            description_text: '#D79921'
        }
      }
      {
        name: history_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: '#98971A'
            selected_text: {bg: '#98971A'}
            description_text: '#D79921'
        }
      }
      {
        name: help_menu
        only_buffer_difference: true
        marker: "? "
        type: {
            layout: description
            columns: 4
            col_width: 20   # Optional value. If missing all the screen width is used to calculate column width
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: '#98971A'
            selected_text: {bg: '#98971A'}
            description_text: '#D79921'
        }
      }
      # Example of extra menus created using a nushell source
      # Use the source field to create a list of records that populates
      # the menu
      {
        name: commands_menu
        only_buffer_difference: false
        marker: "# "
        type: {
            layout: columnar
            columns: 4
            col_width: 20
            col_padding: 2
        }
        style: {
            text: '#98971A'
            selected_text: {bg: '#98971A'}
            description_text: '#D79921'
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
      {
        name: vars_menu
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: list
            page_size: 10
        }
        style: {
            text: '#98971A'
            selected_text: {bg: '#98971A'}
            description_text: '#D79921'
        }
        source: { |buffer, position|
            $nu.scope.vars
            | where name =~ $buffer
            | sort-by name
            | each { |it| {value: $it.name description: $it.type} }
        }
      }
      {
        name: commands_with_description
        only_buffer_difference: true
        marker: "# "
        type: {
            layout: description
            columns: 4
            col_width: 20
            col_padding: 2
            selection_rows: 4
            description_rows: 10
        }
        style: {
            text: '#98971A'
            selected_text: {bg: '#98971A'}
            description_text: '#D79921'
        }
        source: { |buffer, position|
            $nu.scope.commands
            | where name =~ $buffer
            | each { |it| {value: $it.name description: $it.usage} }
        }
      }
  ]
  keybindings: [
    {
      name: completion_menu
      modifier: none
      keycode: tab
      mode: [vi_normal vi_insert]
      event: {
        until: [
          { send: menu name: completion_menu }
          { send: menunext }
        ]
      }
    }
    {
      name: completion_previous
      modifier: shift
      keycode: backtab
      mode: [vi_normal, vi_insert] # Note: You can add the same keybinding to all modes by using a list
      event: { send: menuprevious }
    }
    {
      name: fuzzy_history
      modifier: control
      keycode: char_r
      mode: [vi_normal, vi_insert]
      event: [
        {
          send: ExecuteHostCommand
          cmd: "commandline (
            history
              | each { |it| $it.command }
              | uniq
              | reverse
              | str join (char -i 0)
              | fzf --read0 --layout=reverse --height=40% -q (commandline)
              | decode utf-8
              | str trim
          )"
        }
      ]
    }
    # {
    #   name: history_menu
    #   modifier: control
    #   keycode: char_r
    #   mode: emacs
    #   event: { send: menu name: history_menu }
    # }
    {
      name: next_page
      modifier: control
      keycode: char_x
      mode: [vi_normal, vi_insert]
      event: { send: menupagenext }
    }
    {
      name: undo_or_previous_page
      modifier: control
      keycode: char_z
      mode: [vi_normal, vi_insert]
      event: {
        until: [
          { send: menupageprevious }
          { edit: undo }
        ]
       }
    }
    {
      name: yank
      modifier: control
      keycode: char_y
      mode: [vi_normal, vi_insert]
      event: {
        until: [
          {edit: pastecutbufferafter}
        ]
      }
    }
    {
      name: unix-line-discard
      modifier: control
      keycode: char_u
      mode: [vi_normal, vi_insert]
      event: {
        until: [
          {edit: cutfromlinestart}
        ]
      }
    }
    {
      name: kill-line
      modifier: control
      keycode: char_k
      mode: [vi_normal, vi_insert]
      event: {
        until: [
          {edit: cuttolineend}
        ]
      }
    }
    # Keybindings used to trigger the user defined menus
    {
      name: commands_menu
      modifier: control
      keycode: char_t
      mode: [vi_normal, vi_insert]
      event: { send: menu name: commands_menu }
    }
    {
      name: vars_menu
      modifier: alt
      keycode: char_o
      mode: [vi_normal, vi_insert]
      event: { send: menu name: vars_menu }
    }
    {
      name: commands_with_description
      modifier: control
      keycode: char_s
      mode: [vi_normal, vi_insert]
      event: { send: menu name: commands_with_description }
    }
  ]
}
use std
use std help
source ~/.zoxide.nu

source ~/AppData/Roaming/nushell/alias.nu
source ~/AppData/Roaming/nushell/commands.nu
source ~/AppData/Roaming/nushell/timer.nu
source ~/AppData/Roaming/nushell/weather.nu
source ~/AppData/Roaming/nushell/youtube.nu

source ~/.cache/starship/init.nu

# source ~/AppData/Roaming/nushell/completion/cargo.nu
source ~/AppData/Roaming/nushell/completion/git.nu

if $env.PWD == "C:\\WINDOWS\\system32" or $env.PWD == "C:\\WINDOWS" or $env.PWD == "D:\\Desktop 2\\pin_app\\target\\release" {
    # echo "test"
    cd "D:\\Desktop 2"
}

print $"(ansi title)($env.PWD | path-pretty-no-link)(ansi st)"
clear
source ~/AppData/Roaming/nushell/banner.nu
source ~/.local/share/atuin/init.nu
