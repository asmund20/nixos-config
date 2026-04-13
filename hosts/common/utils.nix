{ config, pkgs, ... }:
{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = with pkgs; [
    hyprland
    ghostty
    (writeShellScriptBin "float-ghostty" ''
      #!/usr/bin/env bash
      # Usage: float-ghostty <command...>
      # Example: float-ghostty htop

      if [ $# -eq 0 ]; then
        echo "Usage: $(basename "$0") <command...>" >&2
        exit 1
      fi

      cmd="$*"   # join arguments with spaces

      # NOTE: $cmd is intentionally unquoted so it gets split into separate words
      hyprctl dispatch exec "[float] ghostty --confirm-close-surface=false -e $cmd"
    '')
  ];
}
