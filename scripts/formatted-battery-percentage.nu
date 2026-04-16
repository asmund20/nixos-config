#!/usr/bin/env nu
let cap = cat /sys/class/power_supply/BAT0/capacity | into int
$"($cap) %"
