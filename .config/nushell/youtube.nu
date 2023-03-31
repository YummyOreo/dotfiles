alias "yt list" = youtube list
alias "yt sub" = youtube sub
alias "yt share" = youtube share
alias "yt watch" = youtube watch
alias MENU = fzf --prompt
# "

let list = (open ~/AppData/Roaming/nushell/list.toml)
let subbed_channels = ($list | get youtube.channels)

let cache = 'C:\\Users\\OreoD\\AppData\\Roaming\\nushell\\cache.toml'

def "youtube sub" [] {
    let channel = ($subbed_channels | to text | MENU "choose channel> " | str trim)
    if ($channel | is-empty) {
        print "user chose to exit"
        return 1
    }

    let channel_feed_url = (http get $"https://www.youtube.com/@($channel)" | query web -q 'link' -a href | find feeds | get 0)
    let titles = (http get $channel_feed_url --raw | query web -q 'title')

    let channel_title = ($titles | get 0)
    let video_titles = ($titles | skip 1)

    let chosen_video_title = ($video_titles | to text | MENU 'open link to>')
    if ($chosen_video_title | is-empty) {
        print "user chose to exit"
        return 1
    }

    let video_hashes = (http get $channel_feed_url --raw | query web -q 'yt\:videoId')

    for $video_title in $video_titles --numbered {
        if $chosen_video_title == $channel_title {
            open https://youtube.com/@($channel)
            sleep 0.3sec
            return 0
        }
        if $chosen_video_title in $video_title.item {
            powershell -c $"mpv --slang=en --ytdl-raw-options=ignore-config=,sub-lang=en,write-auto-sub= --ytdl-format=bestvideo+bestaudio/best --no-fs https://youtube.com/watch?v=($video_hashes | get $video_title.index)"
            sleep 0.3sec
            return 0
        }
    }
}

def "_youtube_try_cache_list" [playlist: string] {
    let id = ($list | get youtube.playlists | get $playlist)

    let channel_feed_url = $"https://www.youtube.com/playlist?list=($id)"
    let $videos = (^$"youtube-dl" -j --flat-playlist $channel_feed_url | split row "\n")
    $videos
}

def "youtube list" [] {
    let playlist = ($list | get youtube.playlists.names | to text | MENU "choose playlist > " | str trim)
    if ($playlist | is-empty) {
        print "user chose to exit"
        return 1
    }


    let videos = (_youtube_try_cache_list $playlist)
    let titles = ($videos | each {|v| $v | query json title})

    let chosen_video_title = ($titles | to text | MENU 'open link to>')
    if ($chosen_video_title | is-empty) {
        print "user chose to exit"
        return 1
    }

    let video_hashes = ($videos | each {|v| $v | query json id})

    for $video_title in $titles --numbered {
        if $video_title.item in $chosen_video_title {
            powershell -c $"mpv --slang=en --ytdl-raw-options=ignore-config=,sub-lang=en,write-auto-sub= --ytdl-format=bestvideo+bestaudio/best --no-fs https://youtube.com/watch?v=($video_hashes | get $video_title.index)"
            sleep 0.3sec
            return 0
        }
    }
}

def "youtube share" [url: string] {
    http get $url
    | str replace --all "<" "\n<"  # separate all HTML blocks into `<...> ...` chunks without the closing `</...>`
    | str replace --all "</.*>" ""
    | lines
    | find "var ytInitialPlayerResponse = "  # all the data is located in this JSON structure...
    | parse --regex 'var ytInitialPlayerResponse = (?<data>.*);'
    | get data.0
    | from json
    | get microformat.playerMicroformatRenderer  # ...and more specifically in this subfield
    | select embed.iframeUrl uploadDate ownerChannelName lengthSeconds title.simpleText  # select the most usefull fields
    | rename url date author length title
    | update length {|it| [$it.length "sec"] | str join | into duration}  # udpate some of the fields for clarity
    | update date {|it| $it.date | into datetime}
    | update url {|it| $it.url | str replace --string "www.youtube.com/embed" "youtu.be"}
}

def "youtube watch" [url: string] {
        powershell -c $"mpv --slang=en --ytdl-raw-options=ignore-config=,sub-lang=en,write-auto-sub= --ytdl-format=bestvideo+bestaudio/best --no-fs ($url)"
    }
