{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        kb_layout = "no";
        kb_variant = "nodeadkeys";
        repeat_rate = 40;
        repeat_delay = 600;
        sensitivity = 0;
        touchpad = {
          disable_while_typing = true;
          natural_scroll = true;
          scroll_factor = 0.5;
          clickfinger_behavior = true;
        };
      };
      cursor = {
        hide_on_key_press = true;
      };
    };
    extraConfig = ''
      device {
        name = compx-mad-8k-dongle-1
        sensitivity = -0.7
      }
    '';
  };
}
