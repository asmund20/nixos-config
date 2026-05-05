{ pkgs, ... }:
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
      text = builtins.readFile ./float-ghostty.nu;
    })
    (writeTextFile {
      name = "formatted-battery-percentage.nu";
      destination = "/bin/formatted-battery-percentage";
      executable = true;
      text = builtins.readFile ./formatted-battery-percentage.nu;
    })
    (writeTextFile {
      name = "vol_and_brgt.nu";
      destination = "/bin/vol_and_brgt";
      executable = true;
      text = builtins.readFile ./vol_and_brgt.nu;
    })
  ];

  home.file.".local/bin/monitor_disable" = {
    text = builtins.readFile ./monitor_disable.nu;
    executable = true;
  };
}
