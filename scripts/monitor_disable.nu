#!/usr/bin/env nu

def main [] {
    mut lastEntry = date now
    while true {
        sleep 1sec
        let log = journalctl -b -u systemd-logind | tail -n 3 | split row "\n" | reverse
        for row in $log {
            let splitRow = $row | split row " "
            let time = $splitRow | slice 0..2 | reduce {|it, acc| $acc + " " + $it} | into datetime
            if ($time > $lastEntry) {
                $lastEntry = date now
                if ($row | str ends-with "closed.") {
                    hyprctl keyword monitor "eDP-1, disable"
                    break
                } else if ($row | str ends-with "opened.") {
                    hyprctl reload
                    break
                }
                
            }
            break
        }
    }
}
