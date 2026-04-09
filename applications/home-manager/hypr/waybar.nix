{
  programs = {
    waybar = {
      enable = true;
      settings.mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [
          "sway/workspaces"
          "sway/mode"
        ];
        modules-center = [ "sway/window" ];
        modules-right = [
          "battery"
          "clock"
        ];
        "sway/window" = {
          "max-length" = 50;
        };
        battery = {
          "format" = "{capacity}% {icon}";
          "format-icons" = [
            ""
            ""
            ""
            ""
            ""
          ];
        };
        "clock" = {
          "format-alt" = "{ :%a, %d. %b  %H:%M}";
        };
        "sway/workspaces" = {
          all-outputs = true;
        };

      };
    };
  };
  wayland.windowManager.hyprland = {
    settings = {
      "exec-once" = [
        "waybar"
      ];
    };
  };
}
