{
  programs = {
    waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          modules-left = [
            "sway/workspaces"
            "sway/mode"
          ];
          modules-center = [ "sway/window" ];
          modules-right = [
            "mpd"
            "custom/mymodule#with-css-id"
            "temperature"
          ];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
        };
      };
      style = ''
        * {
          border: none;
          border-radius: 0;
          font-family: Source Code Pro;
        }
        window#waybar {
          background: #16191C;
          color: #AAB2BF;
        }
        #workspaces button {
          padding: 0 5px;
        }
      '';
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
