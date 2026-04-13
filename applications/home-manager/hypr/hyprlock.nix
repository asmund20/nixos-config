{
  config,
  lib,
  pkgs,
  nixosConfig,
  ...
}:

let
  cfg = nixosConfig.my.hyprlock;
in
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        hide_cursor = true;
        ignore_empty_input = true;
      };
      background = {
        monitor = "";
        path = "${config.xdg.dataHome}/wallpapers/main.jpg";
        blur_passes = 0;
      };

      input-field = {
        monitor = "";
        size = "300, 50";
        position = "0, 0";
        dots_center = true;
        placeholder_text = "";
        outline_thickness = 2;
        fade_on_empty = false;
        inner_color = "rgba(0,0,0,0.2)";
      };

      label = [
        {
          monitor = "";
          text = "cmd[update:1000] date +\"%H:%M\"";
          color = "rgba(0,0,0,1.0)";
          font_size = 48;
          position = "0, 150";
        }
        {
          monitor = "";
          text = "cmd[update:1000] formatted-battery-percentage";
          color = "rgba(0,0,0,1.0)";
          font_size = 18;
          position = "0, 210";
        }
      ];

      auth = lib.mkIf cfg.enableFingerprint {
        fingerprint = {
          enabled = true;
        };
      };
    };
  };
}
