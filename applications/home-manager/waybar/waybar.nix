{ pkgs, ... }:
{

  home.packages = with pkgs; [
    networkmanagerapplet
  ];

  programs = {
    bluetuith.enable = true;
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
            "pulseaudio"
            "network"
            "bluetooth"
            "battery"
            "power-profiles-daemon"
          ];

          "battery" = {
            states = {
              warning = 20;
              critical = 10;
            };
            "format" = "{capacity}% {icon}";
            "format-icons" = {
              "default" = [
                "󰂎"
                "󰁺"
                "󰁻"
                "󰁼"
                "󰁽"
                "󰁾"
                "󰁿"
                "󰂀"
                "󰂁"
                "󰂂"
                "󰁹"
              ];
              "charging" = [
                "󰢟"
                "󰢜"
                "󰂆"
                "󰂇"
                "󰂈"
                "󰢝"
                "󰂉"
                "󰢞"
                "󰂊"
                "󰂋"
                "󰂅"
              ];
            };
          };
          "bluetooth" = {
            format = "";
            format-off = "󰂲";
            format-disabled = "󰂲";
            format-connected = "󰂱";
            format-no-controller = "";
            tooltip-format = "Devices connected: {num_connections}";
            on-click = "float-ghostty 'bluetuith --no-warning'";
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
            on-click = "nm-connection-editor";
          };
          "power-profiles-daemon" = {
            "format" = "{icon}";
            "tooltip-format" = "Power profile: {profile}\nDriver: {driver}";
            "tooltip" = true;
            "format-icons" = {
              "default" = "";
              "performance" = "";
              "balanced" = "";
              "power-saver" = "";
            };
          };
          pulseaudio = {
            "format" = "{volume}% {icon}";
            "format-bluetooth" = "{volume}% {icon}";
            "format-muted" = "";
            "format-icons" = {
              "alsa_output.pci-0000_00_1f.3.analog-stereo" = "";
              "alsa_output.pci-0000_00_1f.3.analog-stereo-muted" = "";
              "headphone" = "";
              "hands-free" = "";
              "headset" = "";
              "phone" = "";
              "phone-muted" = "";
              "portable" = "";
              "car" = "";
              "default" = [
                ""
                ""
              ];
            };
            "scroll-step" = 1;
            "on-click" = "pavucontrol";
            "ignored-sinks" = [ "Easy Effects Sink" ];
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
