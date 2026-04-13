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

      cmd="$*"
      hyprctl dispatch exec "[float] ghostty -e \"$cmd\""
    '')
  ];
}
