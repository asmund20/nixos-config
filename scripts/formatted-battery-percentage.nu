#!/usr/bin/env nu

let battery_folder = "/sys/class/power_supply/BAT0"
if not ($battery_folder | path exists) {
    exit
}
let cap = cat $"($battery_folder)/capacity" | into int
let status = cat $"($battery_folder)/status" | str trim
$"($cap)%" + if $status == "Charging" {" ⚡"} else if $status == "Plugged" {" 🔌"} else {""}
