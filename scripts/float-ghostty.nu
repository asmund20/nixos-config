#!/usr/bin/env nu
def main [cmd: string] {
  hyprctl dispatch exec $"[float] ghostty --confirm-close-surface=false -e ($cmd)"
}
