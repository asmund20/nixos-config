{
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 34;
          modules-left = [
            "hyprland/workspaces"
          ];
          modules-center = [ "clock" ];
          modules-right = [
            "pulseaudio/slider"
            "network"
            "bluetooth"
            "battery"
          ];

          "bluetooth" = {
            format = "";
            format-off = "󰂲";
            format-disabled = "󰂲";
            format-connected = "󰂱";
            format-no-controller = "";
            tooltip-format = "Devices connected: {num_connections}";
          };
          clock = {
            "format" = "{:L%a %d %b %H:%M}";
            "format-alt" = "{:L%d %B W%V %Y}";
          };
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
          network = {
            format-icons = [
              "󰤯"
              "󰤟"
              "󰤢"
              "󰤥"
              "󰤨"
            ];
            format = "{icon}";
            format-wifi = "{icon}";
            format-ethernet = "󰀂";
            format-disconnected = "󰤮";
          };
          "pulseaudio/slider" = {
            min = 0;
            max = 100;
            orientation = "horizontal";
          };
        };
      };
      style = ./style.css;
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
