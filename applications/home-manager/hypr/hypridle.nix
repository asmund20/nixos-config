{
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        ignore_dbus_inhibit = false;
        lock_cmd = "pidof hyprlock >/dev/null || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 3 * 60;
          on-timeout = "brightnessctl -s && brightnessctl s 5%";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 5 * 60;
          on-timeout = "hyprlock";
        }
        # {
        #   timeout = 6*60;
        #   on-timeout = "hyprctl dispatch dpms off";
        #   on-resume = "hyprctl dispatch dpms on";
        # }
      ];
    };
  };
}
