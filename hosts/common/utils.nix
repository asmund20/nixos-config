{ config, pkgs, ... }:
{
  home.sessionPath = [
    "$HOME/.local/bin"
  ];

  home.packages = with pkgs; [
    hyprland
    ghostty
    (writeTextFile {
      name = "float-ghostty.nu";
      destination = "/bin/float-ghostty";
      executable = true;
      text = ''
        #!/usr/bin/env nu
        def main [cmd: string] {
          hyprctl dispatch exec $"[float] ghostty --confirm-close-surface=false -e ($cmd)"
        }
      '';
    })
  ];
}
