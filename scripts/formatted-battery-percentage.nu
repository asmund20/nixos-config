#!/usr/bin/env nu

let cap = cat /sys/class/power_supply/BAT0/capacity | into int
let status = cat /sys/class/power_supply/BAT0/status | str trim
$"($cap) %" + if $status == "Charging" {"⚡"}
    else if $status == "Plugged" {"🔌"}
    else {""}
