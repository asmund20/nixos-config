#!/usr/bin/env nu

use std


# Set the hyprland config for current monitor. Call 'hyprctl reload' to reload
# from config files.
# Input two lists with the same length, one with the columns and one with the
# corresponding value.
#
# Columns are: "position", "scale", "mirrorOf", "disable"
#
# Position requires a value, as well as scale.
# Mirroring is disabled if mirror is called with no argument
# Disable disables the monitor, and ignores the value
def main [
    column: string
    value?: string
    --monitor (-m): string
]: nothing -> string {
    let currentId = hyprctl activeworkspace -j | from json | get monitorID | into int
    let current = hyprctl monitors -a -j | from json | where id == $currentId | first

    if ($column == "disable") {
        hyprctl keyword monitor $"($current.name), disable"
        exit
    }

    mut conf = {
        name: $current.name,
        resolution: $"($current.width)x($current.height)@($current.refreshRate)",
        position: $"($current.x)x($current.y)"
        scale: ($current.scale | into string)
        mirrorOf: ($current.mirrorOf | into string)
    } 

    if ($value != null) {
        $conf = $conf | update $column $value
    } else {
        $conf  = $conf | update $column "none"
    }

    # if ($column == "mirrorOf" and $value == null) {
    #     hyprctl reload
    #     sleep (0.1sec)
    #     pkill waybar
    # }

    let confString = $"($conf.name), ($conf.resolution), ($conf.position), ($conf.scale), mirror, ($conf.mirrorOf)"
    hyprctl keyword monitor $confString
}
