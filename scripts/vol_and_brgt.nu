#!/usr/bin/env nu

let step = 5
let volume_id_file = $"($env.HOME)/.cache/volume_notification_id"
let brightness_id_file = $"($env.HOME)/.cache/brightness_notification_id"
let timeout = 1000 #ms
let timeout_duration = $"($timeout)ms" | into duration

def main [target: string, command: string] {
    match $target {
        "volume" => {volume $command}
        "brightness" => {brightness $command}
        _ => {echo "Did not recognize" + $target}
    }

    sleep ($timeout_duration)

    if (($brightness_id_file | path exists)
            and (age $brightness_id_file) > $timeout_duration) {
        rm $brightness_id_file
    }
    if (($volume_id_file | path exists)
            and (age $volume_id_file) > $timeout_duration) {
        rm $volume_id_file
    }
}

def age [file: string] {
    ls $file | get modified.0 | (date now) - $in
}

def notify [id_file: string, title: string, percentage: int, extra_message: string] {
    let bar_length = 20
    let filled = $percentage * $bar_length / 100 | into int
    let empty = $bar_length - $filled

    mut bar = 0.. | each {"█"} | take $filled | str join
    $bar += 0.. | each {"░"} | take $empty | str join

    if ($id_file | path exists) {
        let id = cat $id_file | into int
        notify-send --expire-time=($timeout) --replace-id=($id) $title ($"($bar) ($percentage)%" + $extra_message)
        touch $id_file
    } else {
        notify-send --expire-time=($timeout) -p $title ($"($bar) ($percentage)%" + $extra_message)
            | save $id_file
    }
}

def volume [command: string] {
    match $command {
        "m" => {pamixer -t},
        "+" => {pamixer -i $step},
        "-" => {pamixer -d $step},
    }

    let percentage = pamixer --get-volume | into int
    let muted = pamixer --get-mute | into bool

    notify $volume_id_file Volume $percentage (if $muted {" muted"} else {""})

}

def brightness [command: string] {
    match $command {
        "+" => {brightnessctl set +5%},
        "-" => {brightnessctl set 5%-}
    }

    let max = brightnessctl m | into int
    let current = brightnessctl g | into int
    let percentage = $current / $max * 100 | into int

    notify $brightness_id_file Brightness $percentage ""
}
